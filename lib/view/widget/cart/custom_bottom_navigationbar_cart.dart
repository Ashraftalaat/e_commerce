import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/data/model/coupon.dart';
import 'package:e_commerce/view/widget/cart/custombuttoncart.dart';
import 'package:e_commerce/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController? mycontroller;
  final void Function()? onApplyCoupon;
  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.mycontroller,
      required this.onApplyCoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponename == null
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: mycontroller,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                border: OutlineInputBorder(),
                                hintText: "Coupon Code",
                                hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomButtonCoupon(
                              textButton: "apply",
                              onPressed: onApplyCoupon,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Coupon Code ${controller.couponename}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    )),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Price"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$price \$",
                          style: const TextStyle(fontFamily: "sans"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Discount"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$discount %",
                          style: const TextStyle(fontFamily: "sans"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Shipping"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$shipping %",
                          style: const TextStyle(fontFamily: "sans"),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(
                      color: AppColor.darkblue,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Total Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.darkblue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$totalprice \$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor,
                              fontFamily: "sans"),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            textButton: "Place Order",
            onPressed: () {
              Get.toNamed(AppNamesRouts.checkout);
            },
          ),
        ],
      ),
    );
  }
}
