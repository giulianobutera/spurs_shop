import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartEmpty());

  void cartLoaded(int amount) {
    emit(CartLoaded(amount));
  }

  void cartEmpty() {
    emit(CartEmpty());
  }
}
