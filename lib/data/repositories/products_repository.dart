import 'package:dartz/dartz.dart';
import 'package:nike_shop/data/datasource/products_datasource.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';

abstract class IProductsRepository {
  Future<Either<String, List<Product>>> getProducts({TypeProduct typeProduct});
}

class ProductsRepository implements IProductsRepository {
  ProductsRepository(this._datasource);
  final ProductsDatasource _datasource;

  @override
  Future<Either<String, List<Product>>> getProducts(
      {TypeProduct typeProduct = TypeProduct.all}) async {
    try {
      List<Product> productList =
          await _datasource.getProducts(typeProduct: typeProduct);
      return right(productList);
    } on AppExceptions catch (ex) {
      return left(ex.message);
    }
  }
}
