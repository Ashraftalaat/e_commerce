import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            const SizedBox(height: 60),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
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
                style: const TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
