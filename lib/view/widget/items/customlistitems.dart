import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/function/translatedatabase.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final Itemsmodel itemsmodel;
  const CustomListItems({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoPageItemsDetails(itemsmodel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag:" ${itemsmodel.itemsImage}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLinkApi.imagestitems}/${itemsmodel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${translateDataBase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    height: 17,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: AppColor.gold,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsmodel.itemsPrice}  \$",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondColor,
                          fontFamily: "sans")),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColor.secondColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
