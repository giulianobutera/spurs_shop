import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';
import 'package:spurs_shop/presentation/providers/cart_provider.dart';
import 'package:spurs_shop/presentation/widgets/cart_item_card.dart';
import 'package:spurs_shop/presentation/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  static const String name = 'cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'SPURS SHOP',
          style: TextStyle(
              fontFamily: 'Spurs',
              color:
                  appTheme.isLightTheme ? appColors.navyBlue : appColors.white,
              fontSize: 35),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) =>
              (state is CartLoaded) && (state.amount > 0)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: GridView.builder(
                              itemCount: cart.cart.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                                childAspectRatio: 3,
                              ),
                              itemBuilder: (context, index) => CartItemCard(
                                item: cart.cart[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'El carrito está vacío',
                        style: TextStyle(
                            color: appTheme.isLightTheme
                                ? appColors.navyBlue
                                : appColors.white),
                      ),
                    )),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: (size.width * 0.35),
                child: Text(
                  'TOTAL: AR\$ ${cart.totalPrice}',
                  style: TextStyle(
                      color: appTheme.isLightTheme
                          ? appColors.navyBlue
                          : appColors.white,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomButton(
                  text: 'Finalizar compra',
                  textColor: appTheme.isLightTheme
                      ? appColors.white
                      : appColors.navyBlue,
                  backgroundColor: appTheme.isLightTheme
                      ? appColors.navyBlue
                      : appColors.white,
                  minWidth: (size.width * 0.40),
                  maxWidth: (size.width * 0.40),
                  minHeight: 50,
                  onPressed: () {}),
            )
          ],
        ),
      )),
    );
  }
}
