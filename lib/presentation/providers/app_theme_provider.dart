import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  bool _isLightTheme = true;

  bool get isLightTheme => _isLightTheme;

  set isLightTheme(bool value) {
    _isLightTheme = value;
    notifyListeners();
  }
}
