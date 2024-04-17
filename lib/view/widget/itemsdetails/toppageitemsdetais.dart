import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/itemsdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPageItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const TopPageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: " ${controller.itemsmodel.itemsImage}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLinkApi.imagestitems}/${controller.itemsmodel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
