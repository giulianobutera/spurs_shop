import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';
import 'package:spurs_shop/presentation/widgets/drawer.dart';
import 'package:spurs_shop/entities/products.dart';
import 'package:spurs_shop/presentation/widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text(
          'SPURS SHOP',
          style: TextStyle(
              fontFamily: 'Spurs',
              color:
                  appTheme.isLightTheme ? appColors.navyBlue : appColors.white,
              fontSize: 35),
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () =>
                      context.push('/item-detail', extra: products[index]),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/search'),
        shape: const CircleBorder(),
        backgroundColor:
            appTheme.isLightTheme ? appColors.navyBlue : appColors.white,
        child: Icon(
          Icons.search,
          color: appTheme.isLightTheme ? appColors.white : appColors.navyBlue,
        ),
      ),
    );
  }
}
