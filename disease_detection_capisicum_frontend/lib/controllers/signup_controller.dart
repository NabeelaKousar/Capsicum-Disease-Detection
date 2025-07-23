import 'package:disease_detection_capisicum/core/services/local_db_server.dart';
import 'package:disease_detection_capisicum/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class SignupController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  var isRememberMe = false.obs;

  // TextEditing Controllers
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var confrirmController = TextEditingController().obs;
  var numberController = TextEditingController().obs;
  var addressController = TextEditingController().obs;

  var character = 'User'.obs;

  var userModel = UserModel().obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  // Register User on Local DB
  Future<int> insertUser(
    UserModel user,
  ) async {
    // Call the database getter
    Database db = await DatabaseHelper.instance.database;

    // Insert the user into the User table
    int id = await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }
}
