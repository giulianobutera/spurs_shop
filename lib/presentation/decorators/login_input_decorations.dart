import 'package:flutter/material.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: appColors.navyBlue),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: appColors.yellow, width: 2)),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: appColors.black),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: appColors.navyBlue,
            )
          : null,
    );
  }
}
