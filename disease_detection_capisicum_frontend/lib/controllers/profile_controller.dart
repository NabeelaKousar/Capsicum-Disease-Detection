import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var selectedGender = ''.obs;
  var imgUrl = ''.obs;
  var isUploading = false.obs;
  var isUpdated = false.obs;
  var isFamilyAdded = false.obs;

  // TextEditing Controllers
  var emailController = TextEditingController().obs;
  var fullNameController = TextEditingController().obs;
  var dateController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchUserData() async {
    await getCurrentUserData();
  }

  Future<void> getCurrentUserData() async {
    try {
      // User? currentUser = FirebaseAuth.instance.currentUser;
      // if (currentUser != null) {
      //   DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(currentUser.uid)
      //       .get();

      //   if (docSnapshot.exists && docSnapshot.data() != null) {
      //     userModel.value =
      //         UserModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
      //   } else {
      //     debugPrint('No user data found for current user');
      //   }
      // } else {
      //   debugPrint('No user is currently signed in');
      // }
    } catch (e) {
      debugPrint('Error getting current user data: $e');
    }
  }

  // Image Picker
  getImage() async {
    isUploading.value = true;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      // String fileName = Path.basename(imageFile.path);
      // var upload = await FirebaseStorage.instance
      //     .ref('uploads/profile/images/$fileName')
      //     .putFile(imageFile);
      // final url = await upload.ref.getDownloadURL();
      // imgUrl.value = url;
      // // update users database
      // await FirebaseFirestore.instance
      //     .collection(userCollection)
      //     .doc(userId.value)
      //     .update({'profileImageUrl': url});
    }
  }
}
