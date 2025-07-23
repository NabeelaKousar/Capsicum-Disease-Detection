import 'package:disease_detection_capisicum/controllers/analysis_controller.dart';
import 'package:disease_detection_capisicum/controllers/home_controller.dart';
import 'package:disease_detection_capisicum/controllers/login_controller.dart';
import 'package:disease_detection_capisicum/controllers/pesticides_controller.dart';
import 'package:disease_detection_capisicum/controllers/profile_controller.dart';
import 'package:disease_detection_capisicum/controllers/signup_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    debugPrint(
        '===================> Start AllBindings initialization <================');

    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AnalysisController>(() => AnalysisController());
    Get.lazyPut<PesticidesController>(() => PesticidesController());

    // Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
