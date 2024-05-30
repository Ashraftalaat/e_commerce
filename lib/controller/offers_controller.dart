import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/offers_data.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List<Itemsmodel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await offersData.getData();
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(listdata2.map((e) => Itemsmodel.fromJson(e)));
        // لو نجح ضيف كل البيانات اللي رجعت
        //  data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

// onInit مثل inistate
  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
