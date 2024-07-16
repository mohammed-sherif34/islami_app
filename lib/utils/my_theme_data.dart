import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),
  );
}
