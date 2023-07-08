import 'package:nike_shop/data/datasource/favorite_product_datasource.dart';
import 'package:nike_shop/models/product.dart';

abstract class IFavoriteProductRepository {
  List<Product> getProducts();
  Future<void> addProduct(Product product);
  Future<void> removeProduct(Product product);
}

class FavoriteProductRepository implements IFavoriteProductRepository {
  final FavoriteProductDatasource _datasource;
  FavoriteProductRepository(this._datasource);

  @override
  Future<void> addProduct(Product product) async {
    await _datasource.addProduct(product);
  }

  @override
  List<Product> getProducts() {
    return _datasource.getProducts();
  }

  @override
  Future<void> removeProduct(Product product) async {
    await _datasource.removeProduct(product);
  }
}
