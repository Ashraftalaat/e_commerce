import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorite/myfavorite_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:e_commerce/core/function/translatedatabase.dart';
import 'package:e_commerce/data/model/myfavorite.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final Myfavoritemodel itemsmodel;

  const CustomListFavoriteItems({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.gotoPageItemsDetails(itemsmodel);
      },
      child: Card(
        
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: " ${itemsmodel.itemsImage}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLinkApi.imagestitems}/${itemsmodel.itemsImage}",
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
                          onPressed: () {
                            controller.deleteFromFav(
                                itemsmodel.favoriteId.toString());
                          },
                          icon: const Icon(Icons.delete_outline_outlined))
                    ],
                  )
                ],
              ),
            ),
            if (itemsmodel.itemsDiscount != 0)
              Positioned(
                top: 7,
                left: 7,
                child: Image.asset(
                  AppImageAsset.sale,
                  height: 50,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
