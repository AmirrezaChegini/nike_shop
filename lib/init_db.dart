import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike_shop/models/product.dart';

Future<void> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>('favoriteProductBox');
}
