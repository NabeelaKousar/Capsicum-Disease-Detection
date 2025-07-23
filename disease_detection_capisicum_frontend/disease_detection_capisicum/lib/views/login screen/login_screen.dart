import 'package:disease_detection_capisicum/controllers/login_controller.dart';
import 'package:disease_detection_capisicum/core/extension_on_widgets.dart';
import 'package:disease_detection_capisicum/utils/constant/app_string.dart';
import 'package:disease_detection_capisicum/utils/constant/constant_image.dart';
import 'package:disease_detection_capisicum/utils/global_variables.dart';
import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/common_elevated_button.dart';
import 'package:disease_detection_capisicum/widgets/custom_assets_image.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:disease_detection_capisicum/widgets/custom_textField.dart';
import 'package:disease_detection_capisicum/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/local_db_server.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const VGap(0.01),
                Column(
                  children: [
                    const CustomAssetsImage(
                      imagePath: AppImage.appLogoImage,
                      height: 150,
                      width: 200,
                      boxFit: BoxFit.cover,
                    ).Centered,
                    const CustomText(
                        text: 'Capsicum Disease Detection',
                        style: AppStyle.montserratBoldBlack14),
                  ],
                ),
                // const VGap(0.03),

                const VGap(0.05),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: AppString.loginToYourAccount,
                          style: AppStyle.montserrat22Bold600,
                        ),
                        const VGap(0.03),
                        CustomTextField(
                            hintText: AppString.hintTextEmail,
                            labelText: AppString.email,
                            controller: controller.emailController.value,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is Required';
                              } else if (!GetUtils.isEmail(value)) {
                                return 'Email is invalid';
                              }
                              return null;
                            }),
                        const VGap(0.02),
                        CustomTextField(
                          hintText: AppString.hintTextPassword,
                          labelText: AppString.password,
                          controller: controller.passwordController.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  activeColor: AppColor.kPrimaryColor,
                                  onChanged: (value) {},
                                ),
                                const CustomText(
                                  text: AppString.rememberMe,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const CustomText(
                              text: AppString.forgotPassword,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const VGap(0.04),
                        CommonElevatedButton(
                          text: AppString.login,
                          width: 500,
                          height: 50,
                          elevation: 0,
                          style: AppStyle.montserratBoldWhite16,
                          borderRadius: 10,
                          buttonColor: AppColor.kPrimaryColor,
                          onPressed: () async {
                            Get.put(LoginController());
                            if (_formKey.currentState!.validate()) {
                              bool userExists = await DatabaseHelper.instance
                                  .login(controller.emailController.value.text,
                                      controller.passwordController.value.text);
                              if (userExists) {
                                Get.offAndToNamed('/home-screen');
                              } else {
                                Get.snackbar(
                                  'Error',
                                  'Invalid email or password',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const VGap(0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        text: AppString.dontHaveAnaAccountRegister,
                        style: AppStyle.montserratRegular12),
                    const HGap(0.01),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed('/signup-screen');
                      },
                      child: const CustomText(
                        text: AppString.register,
                        style: TextStyle(
                            color: AppColor.kPrimaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const VGap(0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
