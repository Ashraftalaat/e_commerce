import 'package:e_commerce/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  gotoSignUp();
  gotoforgetpassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  gotoSignUp() {
    Get.toNamed(AppNamesRouts.signUp);
  }

  @override
  login() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(AppNamesRouts.forgetpassword);
  }
}
