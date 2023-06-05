import 'package:flutter/material.dart';
import 'package:spurs_shop/entities/cart_items.dart';

class CartProvider extends ChangeNotifier {
  List<Item> _cart = [];
  int _totalPrice = 0;

  List<Item> get cart => _cart;

  set cart(List<Item> value) {
    _cart = value;
    notifyListeners();
  }

  int get totalPrice => _totalPrice;

  int get getCartLenght => _cart.length;

  addItemToCart(Item item) {
    _cart.add(item);
    calculateTotalPrice();
    notifyListeners();
  }

  deleteItem(Item item) {
    _cart.remove(item);
    calculateTotalPrice();
    notifyListeners();
  }

  resetCart() {
    _cart = [];
    _totalPrice = 0;
    notifyListeners();
  }

  calculateTotalPrice() {
    _totalPrice = 0;
    for (var element in _cart) {
      _totalPrice += element.product.price;
    }
  }
}
