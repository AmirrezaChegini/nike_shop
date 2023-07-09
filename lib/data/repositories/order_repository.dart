import 'package:nike_shop/data/datasource/order_datasource.dart';
import 'package:nike_shop/models/order.dart';

abstract class IOrderRepository {
  List<Order> getOrders();
  Future<void> addOrder(Order order);
}

class OrderRepository implements IOrderRepository {
  final OrderDatasource _orderDatasource;

  OrderRepository(this._orderDatasource);

  @override
  Future<void> addOrder(Order order) async {
    await _orderDatasource.addOrder(order);
  }

  @override
  List<Order> getOrders() {
    return _orderDatasource.getOrders();
  }
}
