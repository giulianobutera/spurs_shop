import 'package:flutter/material.dart';

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
      colorSchemeSeed: const Color.fromARGB(255, 19, 34, 87),
      brightness: Brightness.dark,
    );
  }
}
