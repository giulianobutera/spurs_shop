import 'package:flutter/material.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  final transitionDuration = const Duration(milliseconds: 250);
  final bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          duration: transitionDuration,
          decoration: const BoxDecoration(color: navyBlue),
          child: Column(
            children: [
              Row(
                children: const [
                  Flexible(
                      child: Text(
                    'Bienvenido',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Flexible(
                      child: Text(
                    'En Spurs Shop encontrarás todos los productos de la tienda oficial de Tottenham Hotspur.',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: isLightTheme
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          title: isLightTheme
              ? const Text('Tema Claro')
              : const Text('Tema oscuro'),
          trailing: Switch(
            value: isLightTheme,
            onChanged: (value) => {},
          ),
        ),
        ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'welcome');
            }),
      ],
    ));
  }
}
