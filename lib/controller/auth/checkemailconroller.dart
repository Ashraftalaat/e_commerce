import 'package:e_commerce/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkemail();
  gotoSuccessSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  // late TextEditingController phone;

  @override
  checkemail() {}

  @override
  gotoSuccessSignUp() {
    Get.offNamed(AppNamesRouts.successsignup);
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
