import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
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
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
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
    titleSmall: TextStyle(
      color: AppColor.backgroundcolor,
      fontSize: 14,
      height: 2,
    ),
  ),
);
