import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/home/customcardhome.dart';
import 'package:e_commerce/view/widget/home/customtitlehome.dart';
import 'package:e_commerce/view/widget/home/listcategorieshome.dart';
import 'package:e_commerce/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  get colorsgr => null;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: ListView(
            children: [
              CustomAppBar(
                titleAppBar: "Find Product",
                onPressedIcon: () {},
                onPressedSearch: () {},
                onPressedIconFav: () {
                  Get.toNamed(AppNamesRouts.myfavorite);
                },
              ),
              const CustomCardHome(
                  title: "A summer Surprise", body: "Cashback  20%"),
              const CustomTitleHome(title: "Categories :"),
              const ListCategories(),
              const CustomTitleHome(title: "Product for you :"),
              const ListItemsHome(),
              const CustomTitleHome(title: "Offer :"),
              const ListItemsHome(),
              const CustomTitleHome(title: "Offer :"),
              const ListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
