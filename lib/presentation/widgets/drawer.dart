import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  final transitionDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          duration: transitionDuration,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 19, 34, 87)),
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
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'welcome');
            }),
      ],
    ));
  }

  // BoxDecoration _coloredBackground() => BoxDecoration(
  //         gradient: LinearGradient(colors: [
  //       Colors.lightBlue.shade400,
  //       Colors.lightBlue.shade200,
  //     ]));
}
