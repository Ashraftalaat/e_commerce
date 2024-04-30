import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud
        .postdata(AppLinkApi.addcart, {"usersid": usersid, "itemsid": itemsid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postdata(
        AppLinkApi.deletecart, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postdata(
        AppLinkApi.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud
        .postdata(AppLinkApi.cartview, {"usersid": usersid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
