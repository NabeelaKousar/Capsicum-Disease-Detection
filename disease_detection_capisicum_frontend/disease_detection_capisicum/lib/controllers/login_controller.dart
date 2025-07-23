import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  var isRememberMe = false.obs;

  // TextEditing Controllers
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  Future<void> loginUser({String? email, String? password}) async {
    isLoading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      //   UserCredential userCredential = await FirebaseAuth.instance
      //       .signInWithEmailAndPassword(email: email!, password: password!);

      //   await pref.setString('userId', userCredential.user!.uid);
      //   debugPrint('Login User :$userCredential');
      //   Get.offAllNamed('/handler-screen');
      // } on FirebaseAuthException catch (e) {
      //   isLoading.value = false;
      //   if (e.code == 'user-not-found') {
      //     debugPrint('No user found for that email.');
      //   } else if (e.code == 'wrong-password') {
      //     debugPrint('Wrong password provided for that user.');
      //   }
    } catch (e) {
      isLoading.value = false;
      debugPrint('$e');
    }
  }
}
