import 'package:hive/hive.dart';
import 'package:nike_shop/models/order.dart';

abstract class OrderDatasource {
  List<Order> getOrders();
  Future<void> addOrder(Order order);
}

class OrderLocal implements OrderDatasource {
  var orderBox = Hive.box<Order>('orderBox');

  @override
  Future<void> addOrder(Order order) async {
    await orderBox.add(order);
  }

  @override
  List<Order> getOrders() {
    return orderBox.values.toList();
  }
}
