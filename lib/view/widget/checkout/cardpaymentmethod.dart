import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckOut extends StatelessWidget {
  final String title;
  final bool isActive;

  const CardPaymentMethodCheckOut(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isActive ? AppColor.secondColor : AppColor.primaryColor,
          
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
