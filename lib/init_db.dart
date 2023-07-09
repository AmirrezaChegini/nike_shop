import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/models/order.dart';
import 'package:nike_shop/models/paymenttype.dart';
import 'package:nike_shop/models/product.dart';

Future<void> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(PaymentTypeAdapter());
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(OrderAdapter());
  await Hive.openBox<Product>('favoriteProductBox');
  await Hive.openBox<Order>('orderBox');
}
