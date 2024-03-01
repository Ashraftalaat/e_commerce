import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length -1) {
      Get.offAllNamed(AppNamesRouts.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    // عشان Get builder هتحدث تغيير في الصفحة
    //update = setstate
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
