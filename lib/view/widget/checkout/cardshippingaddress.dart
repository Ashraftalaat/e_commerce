import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddress extends StatelessWidget {
 final String title;
 final String body;
 final bool isActive;

  const CardShippingAddress({super.key, required this.title, required this.body, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color:isActive ? AppColor.secondColor : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child:  ListTile(
          textColor:isActive? Colors.white: AppColor.black,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            body,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
