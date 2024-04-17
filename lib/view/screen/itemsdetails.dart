import 'package:e_commerce/controller/itemsdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/itemsdetails/priceandcount.dart';
import 'package:e_commerce/view/widget/itemsdetails/subitemsdetailslist.dart';
import 'package:e_commerce/view/widget/itemsdetails/toppageitemsdetais.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(20)),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "Add To Card",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopPageItemsDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.itemsmodel.itemsName}",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColor.darkblue,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                PriceAndCount(
                    onAdd: () {}, onRemove: () {}, price: "200", count: "2"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}${controller.itemsmodel.itemsDesc}",
                  style:
                      const TextStyle(color: AppColor.darkblue, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "color",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColor.darkblue,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SubItemsDetailsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
