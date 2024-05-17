import 'package:e_commerce/controller/checkout_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:e_commerce/view/widget/checkout/carddeliverytype.dart';
import 'package:e_commerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:e_commerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController Controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("CheckOut"),
        ),
        bottomNavigationBar: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: MaterialButton(
            textColor: Colors.white,
            color: AppColor.secondColor,
            onPressed: () {
              Controller.checkout();
            },
            child: const Text(
              "CheckOut",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        body: GetBuilder<CheckOutController>(
            builder: ((controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView(
                      children: [
                        const Text(
                          "Choose Payment Method",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("0");
                          },
                          child: CardPaymentMethodCheckOut(
                              title: "Cash On Delivery",
                              isActive: controller.paymentMethod == "0" //cash
                                  ? true
                                  : false),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("1");
                          },
                          child: CardPaymentMethodCheckOut(
                              title: "Payment Cards",
                              isActive: controller.paymentMethod == "1" //card
                                  ? true
                                  : false),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Choose Delivery Type",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("0");
                              },
                              child: CardDeliveryTypeCheckOut(
                                  imagename: AppImageAsset.delivery,
                                  title: "Delivery",
                                  active:
                                      controller.deliveryType == "0" //delivery
                                          ? true
                                          : false),
                            ),
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("1");
                              },
                              child: CardDeliveryTypeCheckOut(
                                  imagename: AppImageAsset.drivethru,
                                  title: "Recive",
                                  active:
                                      controller.deliveryType == "1" //recive
                                          ? true
                                          : false),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (controller.deliveryType == "0")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Shipping Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.secondColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ...List.generate(
                                controller.dataaddress.length,
                                (index) => InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddressid(
                                        //shipping
                                        "${controller.dataaddress[index].addressId!}");
                                  },
                                  child: CardShippingAddress(
                                      title:
                                          "${controller.dataaddress[index].addressName}  ...  tel/ ${controller.dataaddress[index].addressPhone}",
                                      body:
                                          "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet} ",
                                      isActive: controller.addressid ==
                                              controller
                                                  .dataaddress[index].addressId
                                                  .toString()
                                          ? true
                                          : false),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ))));
  }
}
