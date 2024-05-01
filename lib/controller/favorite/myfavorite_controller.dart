import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/myfavorite_data.dart';
import 'package:e_commerce/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteController extends SearchMixController {
  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<Myfavoritemodel> data = [];
  // late StatusRequest statusRequest;

  getData() async {
    // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => Myfavoritemodel.fromJson(e)));
        // data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

// تم ازالة اكواد التحميل لانهلايوجد وقت للتحميل
  deleteFromFav(String favoriteid) {
    // // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
    // data.clear();
    // // اولا التحميل بياخد وقت
    // statusRequest = StatusRequest.loading;
    // //getData() الموجودة في مجلد data
    var response = myFavoriteData.deleteData(favoriteid);
    // // handlingData هتحدد نتيجة StatusRequest
    // statusRequest = handlingData(response);
    // if (StatusRequest.success == statusRequest) {
    // if (response['status'] == "success") {
    // List responsedata = response['data'];
    // data.addAll(responsedata.map((e) => Myfavoritemodel.fromJson(e)));
    // // data.addAll(response['data']);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    // } else {
    //   // لو مفيش بيانات
    //   statusRequest = StatusRequest.failure;
    // }
    // }

    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
