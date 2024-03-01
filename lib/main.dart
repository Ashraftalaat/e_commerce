import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/localization/changelocale.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/routs.dart';
import 'package:e_commerce/view/screen/login.dart';
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
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          bodyMedium: TextStyle(
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            height: 2,
          ),
          bodySmall: TextStyle(
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 2,
          ),
          headlineLarge: TextStyle(
            color: AppColor.grey,
            //fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 2,
          ),
        ),
      ),
      home: const Login(),
      routes: routes,
    );
  }
}
