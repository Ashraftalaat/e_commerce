import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: AppColor.thirdColor, borderRadius: BorderRadius.circular(20)),
      child:  Text(
        message,
        style: TextStyle(
          color: AppColor.secondColor,
        ),
      ),
    );
  }
}
