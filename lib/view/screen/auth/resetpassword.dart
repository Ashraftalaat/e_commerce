import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';

import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    //  SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Verification code",
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
            //  CustomTextFormAuth(
            //      mycontroller: controller.email,
            //     texthint: "Enter Your Email",
            //     textlabel: "Email",
            //     iconData: Icons.email_outlined),
            const SizedBox(height: 45),
            CustomButtonAuth(
              text: "Check Email",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
