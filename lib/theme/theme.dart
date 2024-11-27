import 'package:flutter/material.dart';

final lightMode = ThemeData(
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0),
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff8CC63E),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ))),
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
    onPrimary: Color(0xff14471E),
    surface: Color(0xff8CC63E),
    secondary: Color(0xffEE9B01),
    secondaryContainer: Color(0xffD9D9D9),
    inversePrimary: Colors.black,
  ),
  useMaterial3: true,
);

final darkMode = ThemeData(
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.black,
      scrolledUnderElevation: 0),
  scaffoldBackgroundColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff8CC63E),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ))),
  colorScheme: const ColorScheme.dark(
    primary: Colors.black,
    onPrimary: Colors.white,
    surface: Color(0xff8CC63E),
    secondary: Colors.white,
    secondaryContainer: Color(0xffD9D9D9),
    inversePrimary: Colors.white,
  ),
  useMaterial3: true,
);
