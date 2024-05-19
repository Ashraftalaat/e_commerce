import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/notification.dart';
import 'package:e_commerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    const NotificationPage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("profile"),
        ),
      ],
    ),
    const Setting(),
  ];

  List bottonAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notification", "icon": Icons.notifications_active_outlined},
    {"title": "Profile", "icon": Icons.person_pin_sharp},
    {"title": "Setting", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
