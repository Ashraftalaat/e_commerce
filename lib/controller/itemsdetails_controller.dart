import 'package:e_commerce/data/model/items.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late Itemsmodel itemsmodel;

  List subItems = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Yellow", "id": 2, "active": "0"},
    {"name": "Blue", "id": 3, "active": "1"},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    itemsmodel = Get.arguments["itemsmodel"];
    update();
  }
}
