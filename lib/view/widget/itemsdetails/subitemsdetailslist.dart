import 'package:e_commerce/controller/itemsdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsDetailsList extends GetView<ItemsDetailsControllerImp> {
  const SubItemsDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 4),
            height: 60,
            width: 100,
            margin: const EdgeInsets.only(top: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColor.darkblue),
                borderRadius: BorderRadius.circular(15),
                color: controller.subItems[index]['active'] == '1'
                    ? AppColor.darkblue
                    : Colors.white),
            child: Text(
              "${controller.subItems[index]['name']}",
              style: TextStyle(
                  color: controller.subItems[index]['active'] == '1'
                      ? Colors.white
                      : AppColor.darkblue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
