import 'dart:io';

import 'package:e_commerce/controller/homescreen_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/view/widget/homescreen/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              // لجعلها دائرية
              shape: const CircleBorder(),
              backgroundColor: AppColor.fourdColor,
              onPressed: () {
                Get.toNamed(AppNamesRouts.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: PopScope(
                canPop: false,
                onPopInvoked: (didPop) {
                  Get.defaultDialog(
                      title: "Warnning",
                      titleStyle: const TextStyle(
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                      middleText: "Do you Want to Exit The App",
                      middleTextStyle: const TextStyle(color: AppColor.black),
                      onConfirm: () {
                        exit(0);
                      },
                      confirmTextColor: AppColor.secondColor,
                      onCancel: () {},
                      cancelTextColor: AppColor.secondColor,
                      buttonColor: AppColor.thirdColor);
                  // alertExitApp();
                },
                child: controller.listPage.elementAt(controller.currentpage))));
  }
}
