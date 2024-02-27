import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/core/localization/changelocale.dart';
import 'package:e_commerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 30),
            CustomButtonLang(
              textButton: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppNamesRouts.onBoarding);
              },
            ),
            const SizedBox(height: 30),
            CustomButtonLang(
              textButton: "En",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppNamesRouts.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
