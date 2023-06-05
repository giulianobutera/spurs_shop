import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  String _userName = 'invitado';
  bool _isLoggedIn = false;

  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}
