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
            "Sign Up",
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
            const CustomTextTitleAuth(texttitle: "Welcome Back"),
            const SizedBox(height: 30),
            const CustomTextBodyAuth(
                textbody:
                    "Sign Up With Your Email And Password OR Continue With Social Media"),
            const SizedBox(height: 25),
            CustomTextFormAuth(
                mycontroller: controller.username,
                texthint: "Enter Your Username",
                textlabel: "Username",
                iconData: Icons.person_2_outlined),
            const SizedBox(height: 30),
            CustomTextFormAuth(
                mycontroller: controller.email,
                texthint: "Enter Your Email",
                textlabel: "Email",
                iconData: Icons.email_outlined),
            const SizedBox(height: 30),
            CustomTextFormAuth(
                mycontroller: controller.phone,
                texthint: "Enter Your Phone",
                textlabel: "Phone",
                iconData: Icons.phone_android),
            const SizedBox(height: 30),
            CustomTextFormAuth(
                mycontroller: controller.password,
                texthint: "Enter Your Password",
                textlabel: "Password",
                iconData: Icons.lock_outline),
            const SizedBox(height: 45),
            Text(
              "Forget Password",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            CustomButtonAuth(
              text: "Sign Up",
              onPressed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextGoToSigninOrSignup(
              textone: "have an account ?",
              texttwo: "Sign In",
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
