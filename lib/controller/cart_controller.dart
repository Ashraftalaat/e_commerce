import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

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
            title: "اشعار", messageText: const Text("تم اضافة المنتج السلة "));
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
            title: "اشعار", messageText: const Text("تم حذف المنتج من السلة "));
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
    view();
    super.onInit();
  }
}
