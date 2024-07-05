import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/middleware/mymiddleware.dart';
import 'package:e_commerce/view/screen/address/add.dart';
import 'package:e_commerce/view/screen/address/adddetails.dart';
import 'package:e_commerce/view/screen/address/view.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/success_signup.dart';
import 'package:e_commerce/view/screen/auth/verifycodesignup.dart';
import 'package:e_commerce/view/screen/cart.dart';
import 'package:e_commerce/view/screen/checkout.dart';
import 'package:e_commerce/view/screen/homescreen.dart';
import 'package:e_commerce/view/screen/items.dart';
import 'package:e_commerce/view/screen/itemsdetails.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/myfavorite.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:e_commerce/view/screen/orders/archive.dart';
import 'package:e_commerce/view/screen/orders/details.dart';
import 'package:e_commerce/view/screen/orders/pending.dart';
import 'package:e_commerce/view/screen/orders/tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  //================ language ===============
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyMiddleWare()],
  ),

  //================= OnBoarding ===================
  GetPage(name: AppNamesRouts.onBoarding, page: () => const OnBoarding()),

  //================= Auth ==================
  GetPage(name: AppNamesRouts.login, page: () => const Login()),
  GetPage(name: AppNamesRouts.signUp, page: () => const SignUp()),
  GetPage(
      name: AppNamesRouts.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppNamesRouts.verifycode, page: () => const Verifycode()),
  GetPage(
      name: AppNamesRouts.resetpasssword, page: () => const ResetPassword()),
  GetPage(
      name: AppNamesRouts.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppNamesRouts.successsignup, page: () => const SuccessSignUp()),
  GetPage(
      name: AppNamesRouts.verifycodesignup,
      page: () => const VerifycodeSignUp()),

  // home
  GetPage(name: AppNamesRouts.homescreen, page: () => const HomeScreen()),

  // items
  GetPage(name: AppNamesRouts.items, page: () => const Items()),
  GetPage(name: AppNamesRouts.itemsdetails, page: () => const ItemsDetails()),

  // favorite
  GetPage(name: AppNamesRouts.myfavorite, page: () => const MyFavorite()),

  // Cart
  GetPage(name: AppNamesRouts.cart, page: () => const Cart()),

  // Check Out
  GetPage(name: AppNamesRouts.checkout, page: () => const CheckOut()),

  // Orders
  GetPage(name: AppNamesRouts.pendingorder, page: () => const OrdersPending()),
  GetPage(name: AppNamesRouts.detailsorder, page: () => const OrdersDetails()),
  GetPage(name: AppNamesRouts.archiveorder, page: () => const OrdersArchiveView()),
  GetPage(name: AppNamesRouts.tracking, page: () => const OrdersTracking()),



  // Address
  GetPage(name: AppNamesRouts.addressview, page: () => const AddressView()),
  GetPage(name: AppNamesRouts.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppNamesRouts.addressadddetails,
      page: () => const AddressAddDetails()),
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
