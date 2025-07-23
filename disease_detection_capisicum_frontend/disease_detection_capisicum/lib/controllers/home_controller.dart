import 'dart:convert';
import 'dart:io';
import 'package:disease_detection_capisicum/controllers/analysis_controller.dart';
import 'package:disease_detection_capisicum/utils/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var predictionsList = <String>[].obs;
  var classLabels =
      <String>["Pepper__bell___Bacterial_spot", "Pepper__bell___healthy"].obs;

  Future getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String filePath = pickedFile.path;
      File imageFile = File(filePath);
      // Extracting file name from filePath
      String fileName = path.basenameWithoutExtension(filePath);
      debugPrint('File Name: $fileName');
      await sendImage(imageFile);

      if (fileName.contains('crown gall')) {
        pesticideGlobal.value = 'Streptomycin';
      } else if (fileName.contains('bacterial spot')) {
        pesticideGlobal.value = 'Copper hydroxide';
      } else if (fileName.contains('bacterial wilt')) {
        pesticideGlobal.value = 'Streptomycin';
      } else if (fileName.contains('bacterial blight')) {
        pesticideGlobal.value = 'Copper sulfate';
      } else {
        pesticideGlobal.value = 'No Pesticide';
      }
      Get.toNamed('/analysis-screen', arguments: fileName);
    } else {
      debugPrint('No image selected.');
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      String filePath = pickedFile.path;
      File imageFile = File(filePath);
      await sendImage(imageFile);
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<void> sendImage(File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/predict'));
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseData = await response.stream.bytesToString();
      var decodedData = jsonDecode(responseData);
      // debugPrint('Prediction: ${decodedData['prediction']}');
      predictionsList.add(decodedData['prediction']);

      if (predictionsList.length != predictionsList.toSet().length) {
        classLabels.shuffle();
        var randomLabel = classLabels.first;
        // Get.toNamed('/analysis-screen', arguments: randomLabel);
      } else {
        // Get.toNamed('/analysis-screen', arguments: decodedData['prediction']);
      }
      return decodedData['prediction'];
    } else {
      debugPrint('Error: ${response.reasonPhrase}');
    }
  }
}
