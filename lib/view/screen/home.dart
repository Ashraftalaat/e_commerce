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
                myController: controller.search,
                titleAppBar: "Find Product",
                //  onPressedIcon: () {},
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onPressedIconFav: () {
                  Get.toNamed(AppNamesRouts.myfavorite);
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
              ),
              !controller.isSearch
                  ? const Column(
                      children: [
                        CustomCardHome(
                            title: "A summer Surprise", body: "Cashback  20%"),
                        CustomTitleHome(title: "Categories :"),
                        ListCategories(),
                        CustomTitleHome(title: "Product for you :"),
                        ListItemsHome(),
                        
                      ],
                    )
                  : Container(
                      child: const Text("Search"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
