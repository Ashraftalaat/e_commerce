import 'package:e_commerce/controller/auth/signup_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtextgotosigninorsignup.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "19".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        //  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        child: ListView(
          children: [
            const SizedBox(height: 40),
             CustomTextTitleAuth(texttitle: "10".tr),
            const SizedBox(height: 30),
             CustomTextBodyAuth(
                textbody:
                    "24".tr),
            const SizedBox(height: 25),
            CustomTextFormAuth(
                mycontroller: controller.username,
                texthint: "23".tr,
                textlabel: "20".tr,
                iconData: Icons.person_2_outlined),
            const SizedBox(height: 30),
            CustomTextFormAuth(
                mycontroller: controller.email,
                texthint: "12".tr,
                textlabel: "18".tr,
                iconData: Icons.email_outlined),
            const SizedBox(height: 30),
            CustomTextFormAuth(
                mycontroller: controller.phone,
                texthint:"22".tr,
                textlabel: "21".tr,
                iconData: Icons.phone_android),
            const SizedBox(height: 30),
            CustomTextFormAuth(
                mycontroller: controller.password,
                texthint: "13".tr,
                textlabel: "19".tr,
                iconData: Icons.lock_outline),
            const SizedBox(height: 45),
            Text(
              "14".tr,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            CustomButtonAuth(
              text: "17".tr,
              onPressed: () {
                controller.signUp();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextGoToSigninOrSignup(
              textone: "25".tr,
              texttwo: "9".tr,
              onTap: () {
                controller.gotoSignIn();
              },
            )
          ],
        ),
      ),
    );
  }
}
