import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/middleware/mymiddleware.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/success_signup.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:e_commerce/view/screen/auth/verifycodesignup.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // language
  GetPage(name: "/", page: ()=> const Language(),middlewares: [
    MyMiddleWare()
  ]),

  // OnBoarding
  GetPage(name: AppNamesRouts.onBoarding, page: ()=> const OnBoarding()),

  // Auth
  GetPage(name: AppNamesRouts.login, page: ()=> const Login()),
  GetPage(name: AppNamesRouts.signUp, page: ()=> const SignUp()),
  GetPage(name: AppNamesRouts.forgetpassword, page: ()=> const ForgetPassword()),
  GetPage(name:  AppNamesRouts.verifycode, page: ()=> const Verifycode()),
  GetPage(name: AppNamesRouts.resetpasssword, page: ()=> const ResetPassword()),
  GetPage(name: AppNamesRouts.successresetpassword, page: ()=> const SuccessResetPassword()),
  GetPage(name: AppNamesRouts.successsignup, page: ()=> const SuccessSignUp()),
  GetPage(name: AppNamesRouts.verifycodesignup, page: ()=> const VerifycodeSignUp()),
];

// // يفضل الروت خارج constant لسهولة التنقل بين الصفحات
// Map<String, Widget Function(BuildContext)> routes = {
//   // Auth
//   AppNamesRouts.login: (context) => const Login(),
//   AppNamesRouts.signUp: (context) => const SignUp(),
//   AppNamesRouts.forgetpassword: (context) => const ForgetPassword(),
//   AppNamesRouts.verifycode: (context) => const Verifycode(),
//   AppNamesRouts.resetpasssword: (context) => const ResetPassword(),
//   AppNamesRouts.successresetpassword: (context) => const SuccessResetPassword(),
//   AppNamesRouts.successsignup: (context) => const SuccessSignUp(),
//   AppNamesRouts.verifycodesignup: (context) => const VerifycodeSignUp(),

//   // OnBoarding
//   AppNamesRouts.onBoarding: (context) => const OnBoarding(),
// };
