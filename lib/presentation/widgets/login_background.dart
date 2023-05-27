// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;

  const LoginBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BackgroundColor(),
          this.child,
        ],
      ),
    );
  }
}

class _BackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(color: navyBlue),
    );
  }
}
