// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double minWidth;
  final double minHeight;
  final double maxWidth;
  final double maxHeight;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onPressed,
    required this.backgroundColor,
    this.minWidth = 0,
    this.minHeight = 0,
    this.maxWidth = 50,
    this.maxHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          minimumSize: MaterialStatePropertyAll(Size(minWidth, minHeight)),
          maximumSize: MaterialStatePropertyAll(Size(maxWidth, maxHeight)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
      onPressed: () => {onPressed?.call()},
      child: Text(
        this.text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
