// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    //لاستقبال او اضافة  وعرض البيانات
    var response = await crud.postdata(AppLinkApi.login, {
      "email": email,
      "password": password,
    });
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
