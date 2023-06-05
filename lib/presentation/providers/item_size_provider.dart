import 'package:flutter/material.dart';

class ItemSizeProvider extends ChangeNotifier {
  String? _size = 'L';

  String? get size => _size;

  set size(String? value) {
    _size = value;
    notifyListeners();
  }

  reset() {
    _size = 'L';
    notifyListeners();
  }
}
