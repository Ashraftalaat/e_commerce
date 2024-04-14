// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/function/translatedatabase.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 130,
      width: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsmodel: Itemsmodel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final Itemsmodel itemsmodel;
  const ItemsHome({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Image.network(
            "${AppLinkApi.imagestitems}/${itemsmodel.itemsImage}",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 150,
          width: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.grey.withOpacity(0.5)),
        ),
        Positioned(
          right: 10,
          left: 15,
          top: 5,
          child: Text(
            "${translateDataBase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
