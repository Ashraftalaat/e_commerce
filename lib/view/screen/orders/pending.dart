import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controller/orders/pending_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/model/orders.dart';
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
        child: GetBuilder<OrdersPendingController>(builder:(controller)=>HandingDataView(statusRequest: controller.statusRequest, widget:  ListView.builder(
          itemCount:controller.data.length,
          itemBuilder:(context,index) =>CardOrderList(listData: controller.data[index],) ,
        
        ),))
       
      ),
    );
  }
}

class CardOrderList extends GetView<OrdersPendingController> {
  final OrdersModel listData;
  const CardOrderList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Order Number : ${listData.ordersId}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Divider(),
             Text("Order Type : ${controller.printOrdersType(listData.ordersType.toString())}"),
             Text("Order Price : ${listData.ordersPrice.toString()} \$"),
             Text("Delivery price :  ${listData.ordersPricedelivery.toString()} \$"),
             Text("Payment Method : ${controller.printPaymentMethod(listData.ordersPaymentmethod.toString())}"),
             Text("Payment Status : ${controller.printOrderStatus(listData.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                const Text(
                  "Total Price : 22o \$",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.secondColor),
                ),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirdColor,
                  onPressed: () {},
                  child: const Text(
                    "Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
