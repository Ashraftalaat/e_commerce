
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/model/cart.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
   CartData cartData = CartData(Get.find());
   MyServices myServices = Get.find();

   double priceOrder = 0.0;
  int totalcountitems = 0;

  List<CartModel> data = [];

  late Itemsmodel itemsmodel;
  
  int countitems = 0;

  late StatusRequest statusRequest;
 // CartController cartController = Get.put(CartController());
  List subItems = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Yellow", "id": 2, "active": "0"},
    {"name": "Blue", "id": 3, "active": "1"},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

addItems(String itemsid) async {
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

   deleteItems(String itemsid) async {
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

  resetVarCart() {
    priceOrder = 0.0;
    totalcountitems = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    
  }

// سوف نضعه في onitial لاكن الموجود في ItemsDetailsControllerImp
  getCountItems(String itemsid) async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        countitems = int.parse(response['data'].toString());
        response['data'];
        print("=========================");
        print("${countitems}");
        return countitems;
        //  data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    // مش محتاجين عمل ريفريش هنا
    // update();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsmodel = Get.arguments["itemsmodel"];
    countitems =
        await getCountItems(itemsmodel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  add() {
    addItems(itemsmodel.itemsId.toString());
    countitems++;
    update();
  }

  delete() {
    if (countitems > 0) {
    deleteItems(itemsmodel.itemsId.toString());
      countitems--;
      update();
    }
  }
}
