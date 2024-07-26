import 'package:e_commerce/controller/payment/register_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/function/alertexitapp.dart';
import 'package:e_commerce/core/function/vaildinput.dart';
import 'package:e_commerce/view/widget/payment/register/custombuttonpayment.dart';
import 'package:e_commerce/view/widget/payment/register/customtextformpayment.dart';
import 'package:e_commerce/view/widget/payment/register/logoregister.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPayment extends StatelessWidget {
  const RegisterPayment({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Payment Integration",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.darkblue),
          ),
        ),
      ),
      body: 
      // PopScope(
      //   canPop: false,
      //   onPopInvoked: (didPop) {
      //     alertExitApp();
      //   },
      //  child:
         GetBuilder<RegisterController>(
          builder: (controller) => HandingDataRequest(
            statusRequest: controller.statusRequest,
            //controller.statusRequest ==
            //         StatusRequest.loading
            //     ? const Center(
            //         child: Text("loading........."),
            //       )
            widget: Container(
              padding: const EdgeInsets.all(15),
              //  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const Logoregister(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormPayment(
                              texthint: "first name",
                              textlabel: "First Name",
                              iconData: Icons.person,
                              mycontroller: controller.firstname,
                              vaild: (val) {
                                return vaildInput(val!, 5, 30, "username");
                              },
                              isNumber: false),
                        ),
                        Expanded(
                          child: CustomTextFormPayment(
                              texthint: "last name",
                              textlabel: "Last Name",
                              iconData: Icons.person,
                              mycontroller: controller.lastname,
                              vaild: (val) {
                                return vaildInput(val!, 5, 30, "username");
                              },
                              isNumber: false),
                        ),
                      ],
                    ),
                    CustomTextFormPayment(
                        texthint: "email",
                        textlabel: "Email",
                        iconData: Icons.email,
                        mycontroller: controller.email,
                        vaild: (val) {
                          return vaildInput(val!, 5, 30, "email");
                        },
                        isNumber: false),
                    CustomTextFormPayment(
                        texthint: "phone",
                        textlabel: "Phone",
                        iconData: Icons.phone,
                        mycontroller: controller.phone,
                        vaild: (val) {
                          return vaildInput(val!, 11, 30, "phone");
                        },
                        isNumber: true),
                    CustomTextFormPayment(
                        texthint: "price",
                        textlabel: "Price",
                        iconData: Icons.person,
                        mycontroller: controller.price,
                        vaild: (val) {
                          return vaildInput(val!, 1, 30, "");
                        },
                        isNumber: true),
                    // CustomTextTitleAuth(texttitle: "10".tr),
                    // const SizedBox(height: 30),
                    // CustomTextBodyAuth(textbody: "11".tr),
                    // const SizedBox(height: 25),
                    // CustomTextFormAuth(
                    //     isNumber: false,
                    //     vaild: (val) {
                    //       return vaildInput(val!, 5, 100, "email");
                    //     },
                    //     mycontroller: controller.email,
                    //     texthint: "12".tr,
                    //     textlabel: "18".tr,
                    //     iconData: Icons.email_outlined),
                    // const SizedBox(height: 30),
                    // GetBuilder<LoginControllerImp>(
                    //   builder: (controller) => CustomTextFormAuth(
                    //       obscuretext: controller.isShowpassword,
                    //       onTapicon: () {
                    //         controller.showPassword();
                    //       },
                    //       isNumber: false,
                    //       vaild: (val) {
                    //         return vaildInput(val!, 5, 30, "password");
                    //       },
                    //       mycontroller: controller.password,
                    //       texthint: "13".tr,
                    //       textlabel: "19".tr,
                    //       iconData: Icons.lock_outline),
                    // ),
                    // const SizedBox(height: 45),
                    // InkWell(
                    //   onTap: () {
                    //   //  controller.gotoforgetpassword();
                    //   },
                    //   child: Text(
                    //     "14".tr,
                    //     textAlign: TextAlign.end,
                    //     style: Theme.of(context).textTheme.headlineLarge,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    CustomButtonPayment(
                      text: "Register",
                      onPressed: () {
                        controller.pay();
                      },
                    ),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    // CustomTextGoToSigninOrSignup(
                    //   textone: "16".tr,
                    //   texttwo: "17".tr,
                    //   onTap: () {
                    //  //   controller.gotoSignUp();
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
   //   ),
    );
  }
}
