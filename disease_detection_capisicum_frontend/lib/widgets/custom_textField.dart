import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:disease_detection_capisicum/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  String? Function(String?)? validator;

  CustomTextField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.keyboardType,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: labelText,
          style: AppStyle.montserratMediumlabel,
        ).paddingOnly(left: 5),
        const VGap(0.01),
        Container(
          decoration: BoxDecoration(
            color: AppColor.kBackgroundColor,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: AppColor.kPrimaryColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyle.montserratMediumHint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10.0),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
