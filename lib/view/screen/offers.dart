import 'package:e_commerce/controller/favorite/favorite_controller.dart';
import 'package:e_commerce/controller/offers_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) =>Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
                myController: controller.search,
                titleAppBar: "Find Product",
                //  onPressedIcon: () {},
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onPressedIconFav: () {
                  Get.toNamed(AppNamesRouts.myfavorite);
                },
                //ويمكن البحث من خلال كل حرف يتكتيب يتعمل لية ريكويست
                // وهذا تكلفة اعلي للسيرفير
                //ويتم من خلال  onCanged
                onChanged: (val) {
                  controller.checkSearch(val);
                },
              ),
              !controller.isSearch
                      ?
           HandingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
            itemCount: controller.data.length,
            itemBuilder: (context, index) => CustomListItemsOffers(
              itemsmodel: controller.data[index],
            ),
          ),
        ):ListItemsSearch(listdatamodel: controller.listdata)
        ],),
      )
    );
  }
}
