import 'package:e_commerce/controller/orders/details_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Table(
                                children: [
                                  const TableRow(
                                    children: [
                                      Text(
                                        "Item",
                                        style: TextStyle(
                                            color: AppColor.secondColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "QTY",
                                        style: TextStyle(
                                            color: AppColor.secondColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            color: AppColor.secondColor),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                  ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(
                                      children: [
                                        Text(
                                          "${controller.data[index].itemsName}",
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${controller.data[index].itemsCount}",
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${controller.ordersModel.ordersPrice}\$",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // TableRow(
                                  //   children: [
                                  //     Text(
                                  //       "fgfg",
                                  //       textAlign: TextAlign.center,
                                  //     ),
                                  //     Text(
                                  //       "1",
                                  //       textAlign: TextAlign.center,
                                  //     ),
                                  //     Text(
                                  //       "1500\$",
                                  //       textAlign: TextAlign.center,
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  right: 60, left: 60, bottom: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    "Total Shipping Price ",
                                    style: TextStyle(
                                        color: AppColor.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${controller.ordersModel.ordersTotalprice}\$",
                                    style: const TextStyle(
                                        color: AppColor.secondColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (controller.ordersModel.ordersType == 0)
                        Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListTile(
                              title: Text(
                                  "Shipping Address For  /  ${controller.ordersModel.addressName}   ${controller.ordersModel.addressPhone} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                "${controller.ordersModel.addressStreet} -- ${controller.ordersModel.addressCity}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (controller.ordersModel.ordersType == 0)
                        Card(
                          child: Container(
                            height: 400,
                            padding: const EdgeInsets.all(15),
                            child: GoogleMap(
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              initialCameraPosition: controller.cameraPosition,
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controller.completercontroller!
                                    .complete(controllermap);
                              },
                            ),
                          ),
                        )
                    ],
                  ),
                )),
      ),
    );
  }
}
