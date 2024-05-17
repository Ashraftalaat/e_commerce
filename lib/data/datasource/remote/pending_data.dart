// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData(String userid) async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.postdata(AppLinkApi.pendingorders, {"id": userid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
