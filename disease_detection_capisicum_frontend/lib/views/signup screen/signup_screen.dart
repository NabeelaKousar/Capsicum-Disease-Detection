import 'package:disease_detection_capisicum/controllers/signup_controller.dart';
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
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({super.key});

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
                const VGap(0.025),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: AppString.registerAnAccount,
                          style: AppStyle.montserrat22Bold600,
                        ),
                        const VGap(0.02),
                        CustomTextField(
                          hintText: AppString.hintTextFirstName,
                          labelText: AppString.firstName,
                          controller: controller.firstNameController.value,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                            return null;
                          },
                        ),
                        const VGap(0.02),
                        CustomTextField(
                            hintText: AppString.hintTextLastName,
                            labelText: AppString.lastName,
                            controller: controller.lastNameController.value,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Last Name';
                              }
                              return null;
                            }),
                        const VGap(0.02),
                        CustomTextField(
                            hintText: AppString.hintTextEmail,
                            labelText: AppString.email,
                            controller: controller.emailController.value,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
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
                            }),
                        const VGap(0.02),
                        CustomTextField(
                            hintText: AppString.hintTextConfirmPassword,
                            labelText: AppString.confirmPassword,
                            controller: controller.confrirmController.value,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is Required';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            }),
                        const VGap(0.02),
                        Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => RadioListTile<String>(
                                  title: const Text(
                                    'User',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black),
                                  ),
                                  value: 'User',
                                  activeColor: AppColor.kPrimaryColor,
                                  groupValue: controller.character.value,
                                  onChanged: (val) {
                                    controller.character.value = val!;
                                    debugPrint(
                                        'Character Value: ${controller.character.value}');
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Obx(
                                () => RadioListTile<String>(
                                  title: const Text(
                                    'Botanist',
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.black),
                                  ),
                                  value: 'Botanist',
                                  activeColor: AppColor.kPrimaryColor,
                                  groupValue: controller.character.value,
                                  onChanged: (val) {
                                    controller.character.value = val!;
                                    debugPrint(
                                        'Character Value: ${controller.character.value}');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        controller.character.value == 'Botanist'
                            ? const VGap(0.02)
                            : const SizedBox.shrink(),
                        controller.character.value == 'Botanist'
                            ? CustomTextField(
                                hintText: AppString.hintTextPhoneNumber,
                                labelText: AppString.phoneNumber,
                                controller: controller.numberController.value,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone Number is Required';
                                  } else if (value.length < 11) {
                                    return 'Phone Number must be at least 11 characters';
                                  }
                                  return null;
                                })
                            : const SizedBox.shrink(),
                        controller.character.value == 'Botanist'
                            ? const VGap(0.02)
                            : const SizedBox.shrink(),
                        controller.character.value == 'Botanist'
                            ? CustomTextField(
                                hintText: AppString.hintTextAddress,
                                labelText: AppString.hintTextAddress,
                                controller: controller.addressController.value,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Address is Required';
                                  }
                                  return null;
                                })
                            : const SizedBox.shrink(),
                        const VGap(0.05),
                        controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColor.kPrimaryColor,
                              ))
                            : CommonElevatedButton(
                                text: AppString.createAccount,
                                width: 500,
                                height: 50,
                                elevation: 0,
                                style: AppStyle.montserratBoldWhite16,
                                borderRadius: 10,
                                buttonColor: AppColor.kPrimaryColor,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (controller
                                            .passwordController.value.text !=
                                        controller
                                            .confrirmController.value.text) {
                                      Get.snackbar(
                                        'Error',
                                        'Password and Confirm Password not match',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                      return;
                                    } else {
                                      controller.userModel.value.role =
                                          controller.character.value;
                                      controller.userModel.value.firstName =
                                          controller
                                              .firstNameController.value.text;
                                      controller.userModel.value.lastName =
                                          controller
                                              .lastNameController.value.text;
                                      controller.userModel.value.email =
                                          controller.emailController.value.text;

                                      controller.userModel.value.password =
                                          controller
                                              .passwordController.value.text;

                                      controller.userModel.value.phone =
                                          controller
                                              .numberController.value.text;

                                      controller.userModel.value.address =
                                          controller
                                              .addressController.value.text;

                                      int id = await controller.insertUser(
                                        controller.userModel.value,
                                      );

                                      // Print the id of the inserted row to the console
                                      debugPrint('inserted row id: $id');

                                      // Show a dialog when the user is registered successfully
                                      Get.dialog(
                                        AlertDialog(
                                          title: const CustomText(
                                              text: 'Success',
                                              style: AppStyle
                                                  .montserratBoldGreen14),
                                          content: const Text(
                                              'User registered successfully now you can login'),
                                          actions: [
                                            TextButton(
                                              child: const CustomText(
                                                  text: 'OK',
                                                  style: AppStyle
                                                      .montserratMediumlabel14Green),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
                const VGap(0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        text: AppString.alreadyhaveanaccountLogin,
                        style: AppStyle.montserratRegular12),
                    const HGap(0.01),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed('/login-screen');
                      },
                      child: const CustomText(
                        text: AppString.login,
                        style: TextStyle(
                            color: AppColor.kPrimaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const VGap(0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
