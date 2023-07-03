import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'iranyekan',
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MyColor.dark,
      foregroundColor: MyColor.white,
      extendedTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'iranyekan',
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColor.white,
      selectedItemColor: MyColor.blue,
      unselectedItemColor: MyColor.dark,
    ),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontSize: 12,
        color: MyColor.grey,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 2,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        color: MyColor.grey,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: MyColor.black,
      ),
    ),
  );
}
