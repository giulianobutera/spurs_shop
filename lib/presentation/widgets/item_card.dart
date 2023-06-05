import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spurs_shop/config/theme/app_theme.dart';
import 'package:spurs_shop/entities/products.dart';
import 'package:spurs_shop/presentation/providers/app_theme_provider.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback? press;

  const ItemCard({Key? key, required this.product, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeProvider>(context);
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(product.image),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(product.title,
                    style: TextStyle(
                        color: appTheme.isLightTheme
                            ? appColors.navyBlue
                            : appColors.white)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('AR\$ ${product.price}',
                    style: TextStyle(
                        color: appTheme.isLightTheme
                            ? appColors.navyBlue
                            : appColors.white,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
