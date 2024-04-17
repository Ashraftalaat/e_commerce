import 'package:e_commerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "setting",
          ),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("profile"),
        ),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("favorite"),
        )
      ],
    ),
  ];

  List titleBottonAppBar = ["Home", "Setting", "Profile", "Favorite"];

  List<IconData> icondata = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
