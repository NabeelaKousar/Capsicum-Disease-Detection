import 'package:disease_detection_capisicum/bindings/all_bindings.dart';
import 'package:disease_detection_capisicum/controllers/analysis_controller.dart';
import 'package:disease_detection_capisicum/controllers/login_controller.dart';
import 'package:disease_detection_capisicum/controllers/pesticides_controller.dart';
import 'package:disease_detection_capisicum/controllers/signup_controller.dart';
import 'package:disease_detection_capisicum/core/services/navigation_service.dart';
import 'package:disease_detection_capisicum/utils/constant/app_string.dart';
import 'package:disease_detection_capisicum/views/home%20screen/home_screen.dart';
import 'package:disease_detection_capisicum/views/login%20screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SignupController());
  Get.put(LoginController());
  Get.put(PesticidesController());
  Get.put(AnalysisController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      title: AppString.projectName,
      // initialRoute: '/login-screen',
      getPages: appRoutes(),
      home: LoginScreen(),
    );
  }
}
