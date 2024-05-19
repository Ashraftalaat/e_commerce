import 'package:e_commerce/controller/orders/pending_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/view/widget/orders/orderlistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: (controller) => HandingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CardOrderList(
                        listData: controller.data[index],
                      ),
                    ),
                  ))),
    );
  }
}
