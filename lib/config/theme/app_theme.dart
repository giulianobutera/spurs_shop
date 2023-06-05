import 'package:flutter/material.dart';

class AppColors {
  final Color navyBlue, yellow, blueGrey, white, black;

  const AppColors(
      {required this.navyBlue,
      required this.yellow,
      required this.blueGrey,
      required this.white,
      required this.black});
}

const AppColors appColors = AppColors(
    navyBlue: Color.fromARGB(255, 19, 34, 87),
    yellow: Color.fromARGB(255, 239, 239, 7),
    blueGrey: Color.fromARGB(255, 96, 125, 139),
    white: Color.fromARGB(255, 255, 255, 255),
    black: Color.fromARGB(255, 0, 0, 0));

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: appColors.white,
      brightness: Brightness.light,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: appColors.navyBlue,
      brightness: Brightness.dark,
    );
  }
}
