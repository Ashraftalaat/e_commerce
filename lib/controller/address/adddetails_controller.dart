import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? phone;

  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    print(lat);
    print(long);
  }

  addAdress() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //getData() الموجودة في مجلد data
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!.toString(),
        name!.text,
        phone!.text,
        city!.text,
        street!.text,
        lat!.toString(),
        long!.toString());
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // لو نجح ضيف كل البيانات اللي رجعت
        Get.offAllNamed(AppNamesRouts.homescreen);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
