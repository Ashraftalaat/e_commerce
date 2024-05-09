import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:e_commerce/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:e_commerce/view/widget/cart/customitemscartlist.dart';
import 'package:e_commerce/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) => HandingDataView(
            statusRequest: cartController.statusRequest,
            widget: BottomNavigationBarCart(
                shipping: "50",
                onApplyCoupon: () {
                  cartController.checkCoupon();
                },
                mycontroller: cartController.controllerCoupon,
                price: "${cartController.priceOrder}",
                discount: "${cartController.discountcoupon}",
                totalprice: "${cartController.getTotalPrice()}"),
          ),
        ),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      //    const TopAppBarCart(title: "My Cart"),
                      TopCardCart(
                          message:
                              "You have ${cartController.totalcountitems} Items in Your List"),
                      const SizedBox(
                        height: 15,
                      ),
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                            onAdd: () async {
                              await cartController
                                  .add("${cartController.data[index].itemsId}");
                              cartController.refreshPage();
                            },
                            onRemove: () async {
                              await cartController.delete(
                                  "${cartController.data[index].itemsId}");
                              cartController.refreshPage();
                            },
                            imagename:
                                "${AppLinkApi.imagestitems}/${cartController.data[index].itemsImage}",
                            name: "${cartController.data[index].itemsName}",
                            //ملحوظة هامة "خطاء تكرار الاسم" itemsprice هنا اجمال السعر وليس سعر قطعة واحدة items_price
                            price: "${cartController.data[index].itemsprice}",
                            count: "${cartController.data[index].countitems}"),
                      ),
                    ],
                  ),
                ))));
  }
}
