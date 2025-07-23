import 'package:disease_detection_capisicum/controllers/profile_controller.dart';
import 'package:disease_detection_capisicum/core/extension_on_widgets.dart';
import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColor.kBackgroundColor,
        ),
      ),
    );
  }
}
