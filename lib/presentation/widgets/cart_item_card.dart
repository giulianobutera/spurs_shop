import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/entities/cart_items.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';
import 'package:spurs_shop/presentation/providers/cart_provider.dart';

class CartItemCard extends StatelessWidget {
  final Item item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  void cartLoaded(BuildContext context, int amount) {
    context.read<CartCubit>().cartLoaded(amount);
  }

  void cartEmpty(BuildContext context) {
    context.read<CartCubit>().cartEmpty();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  cart.deleteItem(item);
                  if (cart.getCartLenght == 0) {
                    cartEmpty(context);
                  } else {
                    cartLoaded(context, cart.getCartLenght);
                  }
                },
              ),
              SizedBox(
                  width: (size.width * 0.25),
                  child: Image.asset(item.product.image)),
              SizedBox(
                width: size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.product.title,
                      style: TextStyle(
                          color: appTheme.isLightTheme
                              ? appColors.navyBlue
                              : appColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('AR\$ ${item.product.price}',
                        style: TextStyle(
                            color: appTheme.isLightTheme
                                ? appColors.navyBlue
                                : appColors.white)),
                    Text('Talle: ${item.size}',
                        style: TextStyle(
                            color: appTheme.isLightTheme
                                ? appColors.navyBlue
                                : appColors.white))
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
