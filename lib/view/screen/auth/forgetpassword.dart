import 'package:e_commerce/controller/auth/forgetpassword_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Forget Password",
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
            const CustomTextTitleAuth(texttitle: "Check Email"),
            const SizedBox(height: 30),
            const CustomTextBodyAuth(
                textbody:
                    "Please Enter Your Email Address To Recive A verification code"),
            const SizedBox(height: 25),
            CustomTextFormAuth(
                mycontroller: controller.email,
                texthint: "Enter Your Email",
                textlabel: "Email",
                iconData: Icons.email_outlined),
            const SizedBox(height: 45),
            CustomButtonAuth(
              text: "Check",
              onPressed: () {
                controller.gotoverifycode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
