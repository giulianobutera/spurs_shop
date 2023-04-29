import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/presentation/providers/login_form_provider.dart';
import 'package:spurs_shop/presentation/decorators/login_input_decorations.dart';
import 'package:spurs_shop/presentation/widgets/login_background.dart';
import 'package:spurs_shop/presentation/widgets/login_card_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              const Text(
                'SPURS SHOP',
                style: TextStyle(
                    fontFamily: 'Spurs', color: Colors.white, fontSize: 50),
              ),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Iniciar sesión',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'ejemplo@gmail.com',
              labelText: 'Email',
              // prefixIcon: Icons.alternate_email_rounded,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no es un correo válido.';
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Contraseña',
              // prefixIcon: Icons.remove_red_eye_outlined
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe tener 6 o más caracteres.';
            },
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              MaterialButton(
                minWidth: 140,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'welcome');
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      'Volver',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(width: 45),
              MaterialButton(
                minWidth: 141,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                onPressed: loginForm.isLoading
                    //  &&
                    //         loginForm.email.length != 0 &&
                    //         loginForm.password.length != 0
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(const Duration(seconds: 3));

                        // TODO: validar si el login es correcto

                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, 'home');
                      },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Ingresando' : 'Aceptar',
                      style: const TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ]));
  }
}
