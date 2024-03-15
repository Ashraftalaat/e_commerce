import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الصلاحيات

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
// كلما قلت زادت الاولوية
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onBoarding") == "1") {
      return const RouteSettings(name: AppNamesRouts.login);
    }
  }
}
