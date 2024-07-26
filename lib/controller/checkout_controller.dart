import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:e_commerce/data/datasource/remote/check_data.dart';
import 'package:e_commerce/data/model/address.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));

  MyServices myServices = Get.find();
  List<AddressModel> dataaddress = [];
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  String? discountcoupon;

  late String couponid;
  late String priceorder;

  int? totalprice;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddressid(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
        // لو نجح ضيف كل البيانات اللي رجعت
        //  data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "please Select Payment Method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "please Select Order Type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "please Select Shipping Address");
    }
    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id").toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10".toString(),
      "ordersprice": priceorder.toString(),
      // "totalprice" : totalprice.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": discountcoupon.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkOutData.checkOut(data);
    print("==================== controllr $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppNamesRouts.homescreen);
        Get.snackbar("Success", "The order was Successfully");
        if (paymentMethod == "1") {
          gotoPayment();
        }
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Try agian");
        // لو مفيش بيانات
      }
    }
    update();
  }

  gotoPayment() {
    Get.toNamed(AppNamesRouts.registerpayment);
  }

  @override
  void onInit() {
    couponid = Get.arguments["couponeid"];
    priceorder = Get.arguments["priceorder"];
    discountcoupon = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
