import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/function/handlingdata.dart';
import 'package:e_commerce/data/datasource/remote/forgetpassword/verifycodeforgetpassword_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  gotoResetPassword(verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  // late String verifycode;
  String? email;
  StatusRequest? statusRequest;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  @override
  checkCode() {}

  @override
  gotoResetPassword(verifycode) async {
// اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //postData() الموجودة في مجلد data
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifycode);

    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppNamesRouts.resetpasssword,
            arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Correct");
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
