import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String usersid, String itemsid) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(
        AppLinkApi.addfavorite, {"usersid": usersid, "itemsid": itemsid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postdata(
        AppLinkApi.removefavorite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
