
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postdata(AppLinkApi.addressview, {
      'usersid' : usersid
    });
    return response.fold((l) => l , (r) => r);
  }

 addData(String usersid,String name,String phone,String city,String street,String lat,String long) async {
    var response = await crud.postdata(AppLinkApi.addressadd, {
      'usersid': usersid,
      'name'   : name ,
      'phone'  : phone,
      'city'   : city,
      'street' : street,
      'lat'    : lat,
      'long'   : long
    });
    return response.fold((l) => l , (r) => r);
  }

   deleteData(String addressid) async {
    var response = await crud.postdata(AppLinkApi.addressdelete, {
      'addressid' : addressid
    });
    return response.fold((l) => l , (r) => r);
  }
} 
