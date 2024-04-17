import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/items/customlistitems.dart';
import 'package:e_commerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: "Find Product",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //العرض 70% من الارتفاع
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return CustomListItems(
                        itemsmodel: 
                            Itemsmodel.fromJson(controller.data[index]));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
