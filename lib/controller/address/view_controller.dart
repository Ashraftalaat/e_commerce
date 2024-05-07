import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:e_commerce/data/model/address.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  // لتخزين الداتا اللي هتيجي من Backend
  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id").toString());
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
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
    getData();
    super.onInit();
  }
}
