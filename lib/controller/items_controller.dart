import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/items_data.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  changeCat(int val, String catval);
  getData(String cateid);
  gotoPageItemsDetails(Itemsmodel itemsmodel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? catid;
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  late Itemsmodel itemsmodel;
  // لتخزين الداتا اللي هتيجي من Backend
  List data = [];
  late StatusRequest statusRequest;

  String deliveryTime = "";

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  initialData() {
    deliveryTime =
        myServices.sharedPreferences.getString("settings_deliverytime")!;
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    catid = Get.arguments["catid"];
    //تحميل البيانات مرة اخري
    getData(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getData(catval);
    update();
  }

  getData(cateid) async {
    // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await itemsData.getData(
        cateid, myServices.sharedPreferences.getString("id")!);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoPageItemsDetails(itemsmodel) {
    Get.toNamed(AppNamesRouts.itemsdetails, arguments: {
      "itemsmodel": itemsmodel,
    });
  }
}
