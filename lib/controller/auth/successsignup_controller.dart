import 'package:e_commerce/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  gotoPageIogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotoPageIogin() {
    Get.offAllNamed(AppNamesRouts.login);
  }
}
