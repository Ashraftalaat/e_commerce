import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/pending_data.dart';
import 'package:e_commerce/data/model/orders.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  getOrders() async {
    // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response["data"];
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String printOrdersType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is bening prepared";
    } else if (val == "2") {
      return "The Order is bening prepared";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
