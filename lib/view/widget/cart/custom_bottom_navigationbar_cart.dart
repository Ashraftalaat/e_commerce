import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;

  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                child: Text("$price \$",style: const TextStyle(fontFamily: "sans"),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Shiping"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping \$",style: const TextStyle(fontFamily: "sans"),),
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
                      fontWeight: FontWeight.bold, color: AppColor.darkblue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$totalprice \$",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.secondColor,fontFamily: "sans"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const CustomButtonCart(textButton: "Place Order"),
        ],
      ),
    );
  }
}
