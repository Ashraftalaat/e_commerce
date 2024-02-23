import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
              width: 250,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
  }
}