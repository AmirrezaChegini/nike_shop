import 'package:hive/hive.dart';
import 'package:nike_shop/models/product.dart';

abstract class FavoriteProductDatasource {
  List<Product> getProducts();
  Future<void> addProduct(Product product);
  Future<void> removeProduct(Product product);
}

class FavoriteProductLocal implements FavoriteProductDatasource {
  var productBox = Hive.box<Product>('favoriteProductBox');

  @override
  Future<void> addProduct(Product product) async {
    await productBox.add(product);
  }

  @override
  List<Product> getProducts() {
    return productBox.values.toList();
  }

  @override
  Future<void> removeProduct(Product product) async {
    await product.delete();
  }
}
