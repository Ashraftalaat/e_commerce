// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getData() async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.offers, {});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
