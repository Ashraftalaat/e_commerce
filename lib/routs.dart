import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/resetpassword.dart';
import 'package:e_commerce/view/screen/auth/verifycode.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:flutter/material.dart';

// يفضل الروت خارج constant لسهولة التنقل بين الصفحات
Map<String, Widget Function(BuildContext)> routes = {
  // Auth
  AppNamesRouts.login: (context) => const Login(),
  AppNamesRouts.signUp: (context) => const SignUp(),
  AppNamesRouts.forgetpassword: (context) => const ForgetPassword(),
  AppNamesRouts.verifycode: (context) => const Verifycode(),
  AppNamesRouts.resetpasssword: (context) => const ResetPassword(),

  // OnBoarding
  AppNamesRouts.onBoarding: (context) => const OnBoarding(),

};
