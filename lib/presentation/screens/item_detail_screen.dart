import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/entities/cart_items.dart';
import 'package:spurs_shop/entities/products.dart';
import 'package:spurs_shop/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';
import 'package:spurs_shop/presentation/providers/cart_provider.dart';
import 'package:spurs_shop/presentation/providers/item_size_provider.dart';
import 'package:spurs_shop/presentation/widgets/custom_button.dart';

class ItemDetailScreen extends StatelessWidget {
  static const String name = 'item_detail_screen';
  final Product product;
  const ItemDetailScreen({super.key, required this.product});

  void cartLoaded(BuildContext context, int amount) {
    context.read<CartCubit>().cartLoaded(amount);
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context);
    final itemSize = Provider.of<ItemSizeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            itemSize.reset();
            context.pop();
          },
        ),
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
      body: _BodyDetail(product: product),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (size.width * 0.25),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Talle'),
                items: const [
                  DropdownMenuItem(value: 'XS', child: Text('XS')),
                  DropdownMenuItem(value: 'S', child: Text('S')),
                  DropdownMenuItem(value: 'M', child: Text('M')),
                  DropdownMenuItem(value: 'L', child: Text('L')),
                  DropdownMenuItem(value: 'XL', child: Text('XL')),
                  DropdownMenuItem(value: 'XXL', child: Text('XXL')),
                ],
                value: itemSize.size,
                onChanged: (value) {
                  itemSize.size = value;
                },
              ),
            ),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomButton(
                  text: 'Añadir al carrito',
                  textColor: appTheme.isLightTheme
                      ? appColors.white
                      : appColors.navyBlue,
                  backgroundColor: appTheme.isLightTheme
                      ? appColors.navyBlue
                      : appColors.white,
                  minWidth: (size.width * 0.40),
                  maxWidth: (size.width * 0.40),
                  minHeight: 50,
                  onPressed: () {
                    cart.addItemToCart(
                        Item(product: product, size: itemSize.size));
                    cartLoaded(context, cart.getCartLenght);
                    itemSize.reset();
                    context.pop();
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class _BodyDetail extends StatelessWidget {
  final Product product;
  const _BodyDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final appTheme = Provider.of<AppThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            child: Image.asset(product.image),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                          color: appTheme.isLightTheme
                              ? appColors.navyBlue
                              : appColors.white,
                          fontSize: 25),
                    ),
                    Text(
                      'AR\$ ${product.price}',
                      style: TextStyle(
                          color: appTheme.isLightTheme
                              ? appColors.navyBlue
                              : appColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(product.description)
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
