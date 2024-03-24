import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  TestData textdata = TestData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await textdata.getData();
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // لو نجح ضيف كل البيانات اللي رجعت
     data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
