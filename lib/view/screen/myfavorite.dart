import 'package:e_commerce/controller/favorite/myfavorite_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: ((controller) => ListView(
                children: [
                  CustomAppBar(
                      titleAppBar: "Find Product",
                      onPressedSearch: () {},
                      onPressedIcon: () {},
                      onPressedIconFav: () {
                        Get.toNamed(AppNamesRouts.myfavorite);
                      }),
                  const SizedBox(height: 10,),
                  HandingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(
                            itemsmodel: controller.data[index]);
                        // Text(controller.data[index].itemsName!);
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
