import 'package:disease_detection_capisicum/models/user_model.dart';
import 'package:get/get.dart';

var token = ''.obs;
var userId = ''.obs;
String userCollection = 'users';
double width = Get.width;
double height = Get.height;
var usersList = <UserModel>[].obs;
var selectedUser = UserModel().obs;
var pesticideGlobal = ''.obs;

// local api endpoint
// String baseUrl = 'http://127.0.0.1:8080';

// local api endpoint for emulator
String baseUrl = 'http://10.0.2.2:8080';
