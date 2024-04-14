

import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/function/translatedatabase.dart';
import 'package:e_commerce/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesmodel: Categoriesmodel.fromJson(
                controller.categories[index],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;

  const Categories({
    super.key,
    required this.categoriesmodel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.gotoItems(controller.categories, i!);
        controller.changeCat(i!,categoriesmodel.categoriesId.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(top: 10, bottom:3),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 5, color: AppColor.fourdColor),
                      ),
                    )
                  : null,
              child: Text(
                "${translateDataBase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
                style: const TextStyle(color: AppColor.black, fontSize: 21),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
