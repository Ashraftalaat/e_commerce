import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            const SizedBox(height: 60),
          
            Image.asset(
              onBoardingList[i].image!,
              fit: BoxFit.fill,
              // height: Get.width / 1.3,
              width: 300,
              height: 370,
            ),
            const SizedBox(height: 20),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black
              ),
              //Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].body!,
                style: const TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 2,
                ),
                //Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
