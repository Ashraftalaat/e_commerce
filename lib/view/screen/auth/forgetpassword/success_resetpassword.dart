import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatefulWidget {
  const SuccessResetPassword({super.key});

  @override
  State<SuccessResetPassword> createState() => _SuccessResetPasswordState();
}

class _SuccessResetPasswordState extends State<SuccessResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "32".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 50),
          Text("37".tr,style: Theme.of(context).textTheme.titleLarge ,),
          const SizedBox(height: 50),
           Text("38".tr,style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 200),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            child: CustomButtonAuth(
              text: "31".tr, 
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
