// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/presentation/providers/signup_form_provider.dart';
import 'package:spurs_shop/presentation/decorators/login_input_decorations.dart';
import 'package:spurs_shop/presentation/providers/user_info_provider.dart';
import 'package:spurs_shop/presentation/widgets/login_background.dart';
import 'package:spurs_shop/presentation/widgets/login_card_container.dart';
import 'package:spurs_shop/presentation/widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  static const String name = 'signup_screen';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPURS SHOP',
              style: TextStyle(
                  fontFamily: 'Spurs', color: appColors.white, fontSize: 50),
            ),
            CardContainer(
              child: Column(
                children: [
                  Text(
                    'Crear nueva cuenta',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => SignupFormProvider(),
                    child: _SignupForm(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final signupForm = Provider.of<SignupFormProvider>(context);
    final userInfo = Provider.of<UserInfoProvider>(context);
    return Form(
        key: signupForm.formKey,
        child: Column(children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'ejemplo123',
              labelText: 'Nombre de usuario',
            ),
            onChanged: (value) => signupForm.username = value,
            validator: (value) {
              return (value != null && value.isNotEmpty && value.length <= 15)
                  ? null
                  : 'Máximo 15 caracteres.';
            },
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'ejemplo@gmail.com',
              labelText: 'Email',
            ),
            onChanged: (value) => signupForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El correo no es válido.';
            },
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Contraseña',
            ),
            onChanged: (value) => signupForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Mínimo 6 caracteres.';
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Volver',
                  textColor: appColors.white,
                  backgroundColor: appColors.blueGrey,
                  minWidth: (size.width * 0.30),
                  maxWidth: (size.width * 0.30),
                  minHeight: 50,
                  onPressed: () => context.pop(),
                ),
                const SizedBox(width: 15),
                CustomButton(
                  text: signupForm.isLoading ? 'Ingresando' : 'Crear cuenta',
                  textColor: appColors.white,
                  backgroundColor: appColors.navyBlue,
                  minWidth: (size.width * 0.30),
                  maxWidth: (size.width * 0.30),
                  minHeight: 50,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (signupForm.isValidForm()) {
                      signupForm.isLoading = true;
                      await Future.delayed(const Duration(seconds: 3));
                      signupForm.isLoading = false;
                      userInfo.userName = signupForm.username;
                      userInfo.isLoggedIn = true;
                      context.push('/');
                    } else {
                      null;
                    }
                  },
                ),
              ],
            ),
          )
        ]));
  }
}
