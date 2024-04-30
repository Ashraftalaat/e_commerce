import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColor.primaryColor,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
