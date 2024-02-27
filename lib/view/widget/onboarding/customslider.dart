import 'package:e_commerce/controller/onboardingcontroller.dart';
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
            Text(
              onBoardingList[i].title!,
              style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(height: 90),
            Image.asset(
              onBoardingList[i].image!,
              fit: BoxFit.fill,
              width: 200,
              height: 230,
            ),
            const SizedBox(height: 70),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].body!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
