import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/routs.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "PlayfairDisplay",
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            bodyMedium: TextStyle(
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 2,
            ),
          )),
      home: const OnBoarding(),
      routes: routes,
    );
  }
}
