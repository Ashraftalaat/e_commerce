// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);

  getData(String usersid) async {
   
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.users, {"id": usersid});
     //fold بترجع 2 parmeter l & r
    return response.fold((l) => l , (r) => r);
  }
} 
