import 'package:nike_shop/models/cart.dart';

abstract class CartState {}

class InitCartState extends CartState {}

class DataCartState extends CartState {
  final List<Cart> cartList;
  DataCartState(this.cartList);
}

class EmptyCartState extends CartState {
  final String message;
  EmptyCartState(this.message);
}

class UnAuthCartState extends CartState {
  final String message;
  UnAuthCartState(this.message);
}

class FailedCartState extends CartState {
  final String errorMessage;
  FailedCartState(this.errorMessage);
}
