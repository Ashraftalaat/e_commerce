import 'package:e_commerce/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  gotoSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  gotoSignIn() {
    Get.offNamed(AppNamesRouts.login);
  }

  @override
  signUp() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppNamesRouts.verifycodesignup);
      //لحذف البيانات وهذا الكلاس من الميموري
      //عن طريق هذا الكود "وهذا في التحديث الجديد  فقط"
      //package GetX
     // Get.delete<SignUpControllerImp>();
      //يوجد طريقة اخري من خلال Get.LazyPut(()=> )
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }
}
