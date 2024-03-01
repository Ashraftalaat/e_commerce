import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:e_commerce/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Sign in",
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
            const LogoAuth(),
            const CustomTextTitleAuth(texttitle: "Welcome Back"),
            const SizedBox(height: 30),
            const CustomTextBodyAuth(
                textbody:
                    "Sign In With Your Email And Password OR Continue With Social Media"),
            const SizedBox(height: 25),
            const CustomTextFormAuth(
                texthint: "Enter Your Email",
                textlabel: "Email",
                iconData: Icons.email_outlined),
            const SizedBox(height: 30),
            const CustomTextFormAuth(
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
              text: "Sign In",
              onPressed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                const InkWell(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
