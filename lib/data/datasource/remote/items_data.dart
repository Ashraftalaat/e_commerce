import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id, String usersid) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud
        .postdata(AppLinkApi.items, {"id": id.toString(), "usersid": usersid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
