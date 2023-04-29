import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 150),
              Image.asset('assets/images/spursLogo.png', scale: 4),
              const SizedBox(height: 70),
              MaterialButton(
                minWidth: 325,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromARGB(255, 19, 34, 87),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    )),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                minWidth: 325,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromARGB(255, 19, 34, 87),
                onPressed: () {},
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Crear una cuenta',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
