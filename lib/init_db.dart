import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike_shop/models/favorite_product.dart';

Future<void> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteProductAdapter());
  await Hive.openBox<FavoriteProduct>('favoriteProductBox');
}
