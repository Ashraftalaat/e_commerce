import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/screen/login.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';


// يفضل الروت خارج constant لسهولة التنقل بين الصفحات
Map<String, Widget Function(BuildContext)> routes = {
  AppNamesRouts.login: (context) => const Login(),
  AppNamesRouts.onBoarding: (context) => const OnBoarding()
};