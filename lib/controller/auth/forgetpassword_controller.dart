import 'package:e_commerce/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  gotoverifycode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  // late TextEditingController phone;

  @override
  checkemail() {}

  @override
  gotoverifycode() {
    Get.offNamed(AppNamesRouts.verifycode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    // phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    // phone.dispose();

    super.dispose();
  }
}
