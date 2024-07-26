import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/notification_data.dart';
import 'package:e_commerce/data/model/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List<NotificationModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  late NotificationModel notificationModel;

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    // update();
    //getData() الموجودة في مجلد data
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id").toString());
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // لو نجح ضيف كل البيانات اللي رجعت
        // data.addAll(response['data']);
        List listdata = response['data'];
        //     // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(listdata.map((e) => NotificationModel.fromJson(e)));
        //   update();
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
      //  update();
    }
    update();
  }

  deleteNotification(String notificationid) async {
    // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationData.deleteData(
        myServices.sharedPreferences.getString("id")!,
        notificationid.toString());
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.notificationId == notificationid);
        getData();
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف الاشعار  "));
        // مش محتاجين البيانات هنا
        //  data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
      //update();
    }
    // مش محتاجين عمل ريفريش هنا
    update();
  }

  refreshgetdata() {
    getData();
    update();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
