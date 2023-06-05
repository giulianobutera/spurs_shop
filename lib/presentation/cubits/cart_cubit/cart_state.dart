part of 'cart_cubit.dart';

abstract class CartState {}

class CartEmpty extends CartState {
  final bool cartEmpty = true;
}

class CartLoaded extends CartState {
  final bool cartEmpty = false;
  final int amount;

  CartLoaded(this.amount);
}
