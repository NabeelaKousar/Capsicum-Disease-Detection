import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static showCommonProcessingDialog({
    required String message,
  }) {
    return Get.dialog(
      AlertDialog.adaptive(
        title: const Text(
          'Processing',
          textAlign: TextAlign.center,
          textScaler: TextScaler.noScaling,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: AppColor.kPrimaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              textScaler: TextScaler.noScaling,
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showErrorDialog(String error) {
    Get.dialog(
      AlertDialog.adaptive(
        title: const Text('Error'),
        content: Text(error),
        actions: [
          CommonElevatedButton(
            text: 'OK',
            textColor: Colors.black,
            buttonColor: AppColor.kPrimaryColor,
            width: 80.0,
            height: 30.0,
            style: AppStyle.montserratBoldWhite16,
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
