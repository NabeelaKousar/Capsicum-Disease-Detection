import 'dart:math';

import 'package:disease_detection_capisicum/core/services/local_db_server.dart';
import 'package:disease_detection_capisicum/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class AnalysisController extends GetxController {
  Rx<bool> isLoading = false.obs;
  var usersList = <UserModel>[].obs;
  var selectedUser = UserModel().obs;
  var prediction = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    printUsers();
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await DatabaseHelper.instance.database;
    return await db.query('users');
  }

  void printUsers() async {
    List<Map<String, dynamic>> users = await getUsers();
    users.forEach((user) {
      UserModel userModel = UserModel.fromMap(user);
      if (userModel.role == 'Botanist') {
        usersList.add(userModel);
        debugPrint(user.toString());
      }
    });

    if (usersList.isNotEmpty) {
      usersList.shuffle();
      selectedUser.value = usersList.first;
    }
  }
}
