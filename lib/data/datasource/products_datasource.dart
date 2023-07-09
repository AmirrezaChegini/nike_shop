import 'package:dio/dio.dart';
import 'package:nike_shop/constants/api.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';
import 'package:nike_shop/utils/error_handler/check_exceptions.dart';
import 'package:nike_shop/utils/extensions/type_product_index.dart';

abstract class ProductsDatasource {
  Future<List<Product>> getProducts({TypeProduct typeProduct});
}

class ProductsRemote implements ProductsDatasource {
  ProductsRemote(this._dio);

  final Dio _dio;

  @override
  Future<List<Product>> getProducts(
      {TypeProduct typeProduct = TypeProduct.all}) async {
    try {
      Response response = await _dio.get(
        Api.products,
        queryParameters: {'sort': typeProduct.getIndex()},
      );

      List<Product> productList =
          response.data.map<Product>((e) => Product.fromMapJson(e)).toList();

      return productList;
    } on DioError catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
