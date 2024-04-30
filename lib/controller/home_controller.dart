import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  gotoItems(List categories, int selectedCat, String catid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;

  HomeData homeData = HomeData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
//  List data = [];
  List categories = [];
  List items = [];

  late StatusRequest statusRequest;

  late TextEditingController search;

  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      update();
    }
  }

  onSearchItems() {
    isSearch = true;
    update();
  }

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await homeData.getData();
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // لو نجح ضيف كل البيانات اللي رجعت
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoItems(categories, selectedCat, catid) {
    Get.toNamed(AppNamesRouts.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": catid,
    });
  }
}
