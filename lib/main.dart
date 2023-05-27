import 'package:flutter/material.dart';
// Theme
import 'package:spurs_shop/config/theme/app_theme.dart';
// Screens
import 'package:spurs_shop/presentation/screens/welcome_screen.dart';
import 'package:spurs_shop/presentation/screens/login_screen.dart';
import 'package:spurs_shop/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTheme = AppTheme().lightTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spurs Shop',
      theme: appTheme,
      initialRoute: 'home',
      routes: {
        'welcome': (_) => const WelcomeScreen(),
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomeScreen(),
      },
    );
  }
}
