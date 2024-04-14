// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/function/translatedatabase.dart';
import 'package:e_commerce/data/model/categories.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListCategories extends GetView<HomeControllerImp> {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Container(
      padding: const EdgeInsets.all(0),
      height: 150,
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

class Categories extends GetView<HomeControllerImp> {
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
        controller.gotoItems(
            controller.categories, i!, categoriesmodel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLinkApi.imagestcategories}/${categoriesmodel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
              "${translateDataBase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
              style: const TextStyle(color: AppColor.black),
            ),
          
        ],
      ),
    );
  }
}
