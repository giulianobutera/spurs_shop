import 'package:flutter/material.dart';

import 'package:spurs_shop/presentation/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: const Text(
          'SPURS SHOP',
          style: TextStyle(
              fontFamily: 'Spurs',
              color: Color.fromARGB(255, 19, 34, 87),
              fontSize: 35),
        ),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
