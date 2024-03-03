import 'package:e_commerce/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  gotoResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifycode;

  @override
  checkCode() {}

  @override
  gotoResetPassword() {
    Get.toNamed(AppNamesRouts.resetpasssword);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
