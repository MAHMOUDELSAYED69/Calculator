import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calculator/utils/constants/font_family.dart';

import '../constants/colors.dart';

abstract class AppTheme {
  //? LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      cardColor: ColorManager.lightGrey,
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(ColorManager.blue),
        thumbColor: WidgetStatePropertyAll(ColorManager.blue),
        trackColor: WidgetStatePropertyAll(ColorManager.white),
        thumbIcon: WidgetStatePropertyAll(
          Icon(
            Icons.light_mode,
            color: ColorManager.white,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: ColorManager.white),
      fontFamily: FontFamilyManager.poppins,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: ColorManager.white,
        centerTitle: false,
        iconTheme: const IconThemeData(color: ColorManager.black),
        titleTextStyle: TextStyle(
            fontFamily: FontFamilyManager.poppins,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: ColorManager.blue,
            color: ColorManager.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 60.sp,
            height: 1,
            color: ColorManager.black,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            fontSize: 20.sp,
            overflow: TextOverflow.ellipsis,
            color: ColorManager.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(ColorManager.blue),
        thumbColor: WidgetStatePropertyAll(ColorManager.blue),
        trackColor: WidgetStatePropertyAll(ColorManager.black),
        thumbIcon: WidgetStatePropertyAll(
          Icon(
            Icons.dark_mode,
            color: ColorManager.white,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: ColorManager.white),
      fontFamily: FontFamilyManager.poppins,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.black,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: ColorManager.black,
        centerTitle: false,
        iconTheme: const IconThemeData(color: ColorManager.white),
        titleTextStyle: TextStyle(
            fontFamily: FontFamilyManager.poppins,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: ColorManager.blue,
            color: ColorManager.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 60.sp,
            height: 1,
            color: ColorManager.white,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            fontSize: 20.sp,
            overflow: TextOverflow.ellipsis,
            color: ColorManager.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
