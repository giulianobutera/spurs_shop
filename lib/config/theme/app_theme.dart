import 'package:flutter/material.dart';

// const appColors = {
//   'navyBlue': Color.fromARGB(255, 19, 34, 87),
//   'yellow': Color.fromARGB(255, 239, 239, 7)
// };

const navyBlue = Color.fromARGB(255, 19, 34, 87);
const yellow = Color.fromARGB(255, 239, 239, 7);

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.white,
      brightness: Brightness.light,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: navyBlue,
      brightness: Brightness.dark,
    );
  }
}
