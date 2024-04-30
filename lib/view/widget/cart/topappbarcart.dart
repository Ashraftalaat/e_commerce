import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBarCart extends StatelessWidget {
  final String title;
  const TopAppBarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkblue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
