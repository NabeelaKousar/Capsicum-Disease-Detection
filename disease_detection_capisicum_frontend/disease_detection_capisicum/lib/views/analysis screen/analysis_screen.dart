import 'dart:ffi';

import 'package:disease_detection_capisicum/controllers/analysis_controller.dart';
import 'package:disease_detection_capisicum/utils/global_variables.dart';
import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AnalysisScreen extends GetView<AnalysisController> {
  AnalysisScreen({super.key});

  var prediction = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
              text: 'Prediction Result', style: AppStyle.montserratBoldWhite14),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                      text: 'Disease Report',
                      style: AppStyle.manropeBoldBlack18),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: 'Prediction : ${prediction}',
                      style: AppStyle.montserratMediumlabel14Black),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                      text: '-------------------------------------',
                      style: AppStyle.montserratMediumlabel14Black),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 300,
                    child: CustomText(
                        text:
                            'You have to use the recommended pesticide for predicted disease',
                        style: AppStyle.montserratMediumlabel14Black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(
                      text: 'Pesticide Name : ${pesticideGlobal.value}',
                      style: AppStyle.montserratBoldGreen14),
                  const SizedBox(
                    height: 30,
                  ),
                  // Column(
                  //   children: [
                  //     Row(
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const CustomText(
                  //             text: 'Botanist Name : ',
                  //             style: AppStyle.montserratBoldGreen14),
                  //         CustomText(
                  //             text:
                  //                 'Dr. ${controller.selectedUser.value.lastName}',
                  //             style: AppStyle.montserratMediumlabel14Black),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const CustomText(
                  //             text: 'Botanist Phone : ',
                  //             style: AppStyle.montserratMediumlabel10Green),
                  //         CustomText(
                  //             text: '${controller.selectedUser.value.phone}',
                  //             style: AppStyle.montserratMediumlabel14Black),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const CustomText(
                  //             text: 'Botanist Email : ',
                  //             style: AppStyle.montserratMediumlabel10Green),
                  //         SizedBox(
                  //           width: 200,
                  //           child: CustomText(
                  //               text: '${controller.selectedUser.value.email}',
                  //               style: AppStyle.montserratMediumlabel14Black),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const CustomText(
                  //             text: 'Botanist Address : ',
                  //             style: AppStyle.montserratMediumlabel10Green),
                  //         SizedBox(
                  //           width: 200,
                  //           child: CustomText(
                  //               text:
                  //                   '${controller.selectedUser.value.address}',
                  //               style: AppStyle.montserratMediumlabel14Black),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ).paddingOnly(left: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
