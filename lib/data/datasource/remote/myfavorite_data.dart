import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(String id) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.myfavoriteview, {"id": id});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String favoriteid) async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.postdata(AppLinkApi.deletefromfav, {"id": favoriteid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
