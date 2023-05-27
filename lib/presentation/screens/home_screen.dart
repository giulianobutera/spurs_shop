import 'package:flutter/material.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';

import 'package:spurs_shop/presentation/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text(
          'SPURS SHOP',
          style: TextStyle(fontFamily: 'Spurs', color: navyBlue, fontSize: 35),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
