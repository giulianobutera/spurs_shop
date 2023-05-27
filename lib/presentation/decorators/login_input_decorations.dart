import 'package:flutter/material.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: navyBlue),
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: yellow, width: 2)),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: navyBlue,
            )
          : null,
    );
  }
}
