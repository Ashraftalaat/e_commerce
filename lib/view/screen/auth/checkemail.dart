import 'package:e_commerce/controller/auth/checkemailconroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Check Email",
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
            CustomTextTitleAuth(texttitle: "28".tr),
            const SizedBox(height: 30),
            CustomTextBodyAuth(textbody: "29".tr),
            const SizedBox(height: 25),
            CustomTextFormAuth(
                mycontroller: controller.email,
                texthint: "12".tr,
                textlabel: "18".tr,
                iconData: Icons.email_outlined),
            const SizedBox(height: 45),
            CustomButtonAuth(
              text: "30".tr,
              onPressed: () {
                controller.gotoSuccessSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
