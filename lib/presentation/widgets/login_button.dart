// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final double width = 325;

  const LoginButton({Key? key, double? width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(navyBlue),
          minimumSize: MaterialStatePropertyAll(Size(325, 50))),
      onPressed: () => {},
      child: Text(
        this.text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
