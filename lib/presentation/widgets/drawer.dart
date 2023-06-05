import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';
import 'package:spurs_shop/presentation/providers/cart_provider.dart';
import 'package:spurs_shop/presentation/providers/user_info_provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  final transitionDuration = const Duration(milliseconds: 250);

  void cartEmpty(BuildContext context) {
    context.read<CartCubit>().cartEmpty();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    final appTheme = Provider.of<AppThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          duration: transitionDuration,
          decoration: BoxDecoration(color: appColors.navyBlue),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: Text(
                    'Bienvenido ${userInfo.userName}',
                    style: TextStyle(color: appColors.white),
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    'En Spurs Shop encontrarás todos los productos de la tienda oficial de Tottenham Hotspur.',
                    style: TextStyle(color: appColors.white),
                  )),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: appTheme.isLightTheme
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          title: appTheme.isLightTheme
              ? const Text('Tema claro')
              : const Text('Tema oscuro'),
          trailing: Switch(
            value: appTheme.isLightTheme,
            onChanged: (value) =>
                {appTheme.isLightTheme = !appTheme.isLightTheme},
          ),
        ),
        ListTile(
          leading: userInfo.isLoggedIn
              ? const Icon(Icons.logout_outlined)
              : const Icon(Icons.login_outlined),
          title: userInfo.isLoggedIn
              ? const Text('Cerrar sesión')
              : const Text('Iniciar sesión o crear una nueva cuenta'),
          onTap: () {
            appTheme.isLightTheme = true;
            userInfo.isLoggedIn = false;
            cart.resetCart();
            cartEmpty(context);
            context.push('/welcome');
          },
        ),
      ],
    ));
  }
}
