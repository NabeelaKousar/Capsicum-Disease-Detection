import 'package:disease_detection_capisicum/controllers/home_controller.dart';
import 'package:disease_detection_capisicum/core/extension_on_widgets.dart';
import 'package:disease_detection_capisicum/utils/constant/constant_image.dart';
import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/common_elevated_button.dart';
import 'package:disease_detection_capisicum/widgets/custom_assets_image.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:disease_detection_capisicum/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
            text: 'Disease Dictionary',
            style: AppStyle.montserratBoldWhite14,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.help,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed('/pestisides-screen');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const VGap(0.05),
              CommonElevatedButton(
                text: 'Bacterial Wilt',
                buttonColor: AppColor.kPrimaryLighColor,
                width: 200,
                height: 50,
                onPressed: () {
                  Get.toNamed('/bacterialWilt-screen');
                },
                style: AppStyle.montserratBoldWhite14,
                borderRadius: 0,
              ),
              const VGap(0.05),
              CommonElevatedButton(
                text: 'Bacterial Leaf Spot',
                buttonColor: AppColor.kPrimaryLighColor,
                width: 200,
                height: 50,
                onPressed: () {
                  Get.toNamed('/bacterialLeafSpot-screen');
                },
                style: AppStyle.montserratBoldWhite14,
                borderRadius: 0,
              ),
              const VGap(0.05),
              CommonElevatedButton(
                text: 'Bacterial Blight',
                buttonColor: AppColor.kPrimaryLighColor,
                width: 200,
                height: 50,
                onPressed: () {
                  Get.toNamed('/bacterialBlight-screen');
                },
                style: AppStyle.montserratBoldWhite14,
                borderRadius: 0,
              ),
              const VGap(0.05),
              CommonElevatedButton(
                text: 'Crown Gall',
                buttonColor: AppColor.kPrimaryLighColor,
                width: 200,
                height: 50,
                onPressed: () {
                  Get.toNamed('/powderyMildew-screen');
                },
                style: AppStyle.montserratBoldWhite14,
                borderRadius: 0,
              ),
              const VGap(0.08),
              CommonElevatedButton(
                text: 'Upload Photo',
                buttonColor: AppColor.kPrimaryColor,
                width: 200,
                height: 50,
                onPressed: () {
                  controller.getImageFromGallery();
                },
                style: AppStyle.montserratBoldWhite14,
                borderRadius: 10,
              ),
            ],
          ).Centered,
        ),
      ),
    );
  }
}
