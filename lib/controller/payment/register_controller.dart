import 'package:e_commerce/core/class/paymob_manager.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/payment/register_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  PaymentData paymentData = PaymentData(Get.find());
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController price;

  // late bool isShowpassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  // validateText() {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     print("===================valid");
  //   }
  // }

  Future<void> pay() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
       int priceInt = int.parse(price.text);
      PaymobManager()
          .getPaymentKey(priceInt, "EGP", firstname.text, lastname.text,
              email.text, phone.text)
          .then((String paymentkey) {
        // هنجيب iframe
        launchUrl(Uri.parse(
            "https://accept.paymob.com/api/acceptance/iframes/855458?payment_token=$paymentkey"));
      });
    }
    update();
  }

//   late DioHelper dioHelper;

// // ارسال Token الحساب علي Paymob
//   Future<void> getAuthToken() async {
//     //   statusRequest = StatusRequest.loading;
//     DioHelper.postDataDio(url: AppLinkApi.getauthtoken, data: {
//       "api_key": AppLinkApi.paymentapikey,
//       //هيتم ارسال Token اخر هنخزنه في المتغير paymentfirsttoken
//     }).then((value) {
//       //هناخد token نسخ من response في ثيندر كلاينت
//       AppLinkApi.paymentfirsttoken = value.data.token;
//       print("============ PaymentFirstToken============");
//       print(AppLinkApi.paymentfirsttoken);
//       print("=========================");
//     });
  //  print("==================== controllr $response");
  // handlingData هتحدد نتيجة StatusRequest
  //  statusRequest = handlingData(response);

  // if (StatusRequest.success == statusRequest) {
  //   print("============ PaymentFirstToken============");
  //   print(AppLinkApi.paymentfirsttoken);
  //   print("=========================");
  // } else {
  //   // لو مفيش بيانات
  //   statusRequest = StatusRequest.failure;
  // }
  //   update();
  // }

  // getToken() async {
  //   // اولا التحميل بياخد وقت
  //   statusRequest = StatusRequest.loading;
  //   //getData() الموجودة في مجلد data
  //   var response = await paymentData.getAuthToken(AppLinkApi.paymentapikey);
  //   print("==================== controllr $response");
  //   // handlingData هتحدد نتيجة StatusRequest
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['token']) {
  //       AppLinkApi.paymentfirsttoken = response['token'];
  //       // لو نجح ضيف كل البيانات اللي رجعت
  //       data.addAll(response['token']);
  //       //  data.addAll(listdata.map((e) => NotificationModel.fromJson(e)));
  //       print(data);
  //     } else {
  //       // لو مفيش بيانات
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  // showPassword() {
  //   isShowpassword = isShowpassword == true ? false : true;
  //   update();
  // }

  // @override
  // gotoSignUp() {
  //   Get.toNamed(AppNamesRouts.signUp);
  // }

  // @override
  // login() async {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     // اولا التحميل بياخد وقت
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     //postData() الموجودة في مجلد data
  //     var response = await loginData.postData(email.text, password.text);
  //     print("==================== controllr $response");
  //     // handlingData هتحدد نتيجة StatusRequest
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         if (response['data']['users_approve'] == 1) {
  //           myServices.sharedPreferences
  //               .setString("id", response['data']['users_id'].toString());
  //           String usersid =
  //               myServices.sharedPreferences.getString("id").toString();
  //           myServices.sharedPreferences.setString(
  //               "username", response['data']['users_name'].toString());
  //           myServices.sharedPreferences
  //               .setString("email", response['data']['users_email'].toString());
  //           myServices.sharedPreferences
  //               .setString("phone", response['data']['users_phone'].toString());
  //           myServices.sharedPreferences.setString("step", "2");

  //           // اشعار لمستخدم واحد
  //           FirebaseMessaging.instance.subscribeToTopic("users$usersid");
  //           // اشعار لكل المستخدمين
  //           FirebaseMessaging.instance.subscribeToTopic("users");

  //           Get.offNamed(AppNamesRouts.homescreen);
  //         } else {
  //           Get.toNamed(AppNamesRouts.verifycodesignup,
  //               arguments: {"email": email.text});
  //         }
  //       } else {
  //         Get.defaultDialog(
  //             title: "Warning", middleText: "Password Or Email Not Correct");
  //         // لو مفيش بيانات
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();
  //   } else {}
  // }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    // getToken();

    firstname = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    price = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    phone.dispose();
    price.dispose();
    super.dispose();
  }

  // @override
  // gotoforgetpassword() {
  //   Get.toNamed(AppNamesRouts.forgetpassword);
  // }
}
