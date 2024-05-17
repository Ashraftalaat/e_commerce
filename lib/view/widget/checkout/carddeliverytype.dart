import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;

  const CardDeliveryTypeCheckOut(
      {super.key,
      required this.imagename,
      required this.title,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: 120,
      height: 130,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondColor, width: 2),
          color: active ? AppColor.secondColor : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 60,
            // color: ,
            //  fit: BoxFit.fill,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color:active?Colors.white:AppColor.secondColor),
          )
        ],
      ),
    );
  }
}
