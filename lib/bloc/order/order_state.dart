import 'package:equatable/equatable.dart';
import 'package:nike_shop/models/order.dart';

abstract class OrderState extends Equatable {}

class InitOrderState extends OrderState {
  @override
  List<Object?> get props => [];
}

class CompletedOrderState extends OrderState {
  final List<Order> orderList;
  CompletedOrderState(this.orderList);
  @override
  List<Object?> get props => [orderList];
}

class EmptyOrderState extends OrderState {
  final String message;
  EmptyOrderState(this.message);
  @override
  List<Object?> get props => [message];
}
