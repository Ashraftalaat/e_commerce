// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;

  const PriceAndCount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(bottom: 4),
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.black),
              ),
              child:  Text(
                count,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.1,
                  color: AppColor.black,
                ),
              ),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
         Text(
          "$price \$",
          style: const TextStyle(
              color: AppColor.fourdColor, fontSize: 30, fontFamily: "sans"),
        )
      ],
    );
  }
}
