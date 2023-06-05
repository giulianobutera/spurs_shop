import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/router/app_router.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';
import 'package:spurs_shop/presentation/providers/cart_provider.dart';
import 'package:spurs_shop/presentation/providers/item_size_provider.dart';
import 'package:spurs_shop/presentation/providers/user_info_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserInfoProvider()),
          ChangeNotifierProvider(create: (_) => AppThemeProvider()),
          ChangeNotifierProvider(create: (_) => ItemSizeProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          BlocProvider(create: (_) => CartCubit())
        ],
        child: Consumer<AppThemeProvider>(
            builder: (context, AppThemeProvider appTheme, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Spurs Shop',
            theme: appTheme.isLightTheme
                ? AppTheme().lightTheme()
                : AppTheme().darkTheme(),
            routerConfig: appRouter,
          );
        }));
  }
}
