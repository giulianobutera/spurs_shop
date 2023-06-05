import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/presentation/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String name = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/spursLogo.png', scale: 5),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CustomButton(
                text: 'Iniciar sesión',
                textColor: appColors.white,
                backgroundColor: appColors.navyBlue,
                onPressed: () => context.push('/login'),
                minWidth: (size.width * 0.85),
                minHeight: 50,
                maxWidth: (size.width * 0.85),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomButton(
                text: 'Crear una cuenta',
                textColor: appColors.white,
                backgroundColor: appColors.navyBlue,
                onPressed: () => context.push('/signup'),
                minWidth: (size.width * 0.85),
                minHeight: 50,
                maxWidth: (size.width * 0.85),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomButton(
                text: 'Ingresar como invitado',
                textColor: appColors.white,
                backgroundColor: appColors.navyBlue,
                onPressed: () => context.push('/'),
                minWidth: (size.width * 0.85),
                minHeight: 50,
                maxWidth: (size.width * 0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
