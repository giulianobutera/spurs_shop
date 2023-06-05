import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';

class SearchScreen extends StatelessWidget {
  static const String name = 'search_screen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Busqueda')),
          actions: [
            BlocBuilder<CartCubit, CartState>(
                builder: (context, state) => IconButton(
                    onPressed: () => context.push('/cart'),
                    icon: (state is CartLoaded) && (state.amount > 0)
                        ? Badge(
                            backgroundColor: appTheme.isLightTheme
                                ? appColors.navyBlue
                                : appColors.white,
                            label: Text(
                              state.amount.toString(),
                              style: TextStyle(
                                  color: appTheme.isLightTheme
                                      ? appColors.white
                                      : appColors.navyBlue),
                            ),
                            child: const Icon(Icons.shopping_cart_outlined),
                          )
                        : const Icon(Icons.shopping_cart_outlined))),
          ],
        ),
        body: const Center());
  }
}
