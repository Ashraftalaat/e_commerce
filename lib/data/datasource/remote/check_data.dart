// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);

  checkOut(Map data) async {
    // هنضع الباراميترات في controller
    var response = await crud.postdata(AppLinkApi.checkOut, data );
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
