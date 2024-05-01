import 'package:e_commerce/controller/favorite/favorite_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/items/customlistitems.dart';
import 'package:e_commerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
   ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
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
            // CustomAppBar(
            //   titleAppBar: "Find Product",
            //  // onPressedIcon: () {},
            //   onPressedSearch: () {},
            //   onPressedIconFav: (){
            //     Get.toNamed(AppNamesRouts.myfavorite);
            //   },
            // ),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget:!controller.isSearch ?
                 GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //العرض 70% من الارتفاع
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    // ملينا المتغير isFavorite اللي من نوع Map
                    // بكل items = favorite 1 or 0
                    // عشان يظهر كل items في الصفحة
                    controllerFav
                            .isFavorite[controller.data[index]['items_id']] =
                        controller.data[index]['favorite'].toString();

                    return CustomListItems(
                      itemsmodel: Itemsmodel.fromJson(
                        controller.data[index],
                      ),
                    );
                  },
                ):ListItemsSearch(listdatamodel: controller.listdata)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
