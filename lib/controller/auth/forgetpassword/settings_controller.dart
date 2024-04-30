import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppNamesRouts.login);
  }
}
