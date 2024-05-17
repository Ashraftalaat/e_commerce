import 'dart:ffi';
import 'dart:ui';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/model/cart.dart';
import 'package:e_commerce/data/model/coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  TextEditingController? controllerCoupon;
  CouponModel? couponModel;
  int discountcoupon = 0;
  String? couponename;

  String? couponid;

  late StatusRequest statusRequest;

  List<CartModel> data = [];
  double priceOrder = 0.0;
  int totalcountitems = 0;

  int countitems = 0;

  add(String itemsid) async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //getData() الموجودة في مجلد data
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج السلة "));
        // مش محتاجين البيانات هنا
        //  data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //getData() الموجودة في مجلد data
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من السلة "));
        // مش محتاجين البيانات هنا
        //  data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  view() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(dataresponsecountprice['totalitems'].toString());
          priceOrder =
              double.parse(dataresponsecountprice['totalprice'].toString());

          //  data.addAll(response['data']);
        }
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //getData() الموجودة في مجلد data
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //ماب عشان البيانات اللي بترجع في صورة ماب
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!.toString());
        couponename = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        // لو مفيش بيانات
        //  statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponename = null;
        couponid = null;
        Get.snackbar("warning", "coupon not valid");
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceOrder - priceOrder * discountcoupon / 100);
  }

  gotoPageCheckOut() {
    //يجب وضع return حتي لايظهر الرسالة ويدخل علي صفحة checkout
    if (data.isEmpty) {
      return Get.snackbar("تنبية", "السلة فارغة");
    }
    Get.toNamed(AppNamesRouts.checkout, arguments: {
      //ولو بيساوي null خلية بيساوي صفر
      "couponeid": couponid ?? "0",
      "priceorder": priceOrder.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }

  resetVarCart() {
    priceOrder = 0.0;
    totalcountitems = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    super.onInit();
  }
}
