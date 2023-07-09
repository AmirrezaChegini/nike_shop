import 'package:nike_shop/models/order.dart';

abstract class OrderEvent {}

class AddOrderEvent extends OrderEvent {
  final Order order;
  AddOrderEvent(this.order);
}

class GetOrdersEvent extends OrderEvent {}
