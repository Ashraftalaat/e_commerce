import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/screen/login.dart';
import 'package:flutter/material.dart';


Map<String, Widget Function(BuildContext)> routes = {
  AppNamesRouts.login :(context) =>  const Login()
};
