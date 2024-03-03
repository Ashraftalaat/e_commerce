import 'package:e_commerce/controller/auth/resetpassword_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Reset Password",
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
            const CustomTextTitleAuth(texttitle: "New Password"),
            const SizedBox(height: 30),
            const CustomTextBodyAuth(textbody: "Please Enter New Password"),
            const SizedBox(height: 25),
            CustomTextFormAuth(
                mycontroller: controller.password,
                texthint: "Enter Your New Password",
                textlabel: "Password",
                iconData: Icons.email_outlined),
            const SizedBox(height: 25),
            CustomTextFormAuth(
                mycontroller: controller.rePassword,
                texthint: "Enter Your RePassword",
                textlabel: "Confirm",
                iconData: Icons.email_outlined),
            const SizedBox(height: 45),
            CustomButtonAuth(
              text: "Save",
              onPressed: () {
                controller.gotoSuccessResetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}
