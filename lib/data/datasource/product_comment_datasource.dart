import 'package:dio/dio.dart';
import 'package:nike_shop/constants/api.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/product_comment.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';
import 'package:nike_shop/utils/error_handler/check_exceptions.dart';

abstract class ProductCommentDatasource {
  Future<List<ProductComment>> getComments({required int productId});
}

class ProductCommentRemote implements ProductCommentDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductComment>> getComments({required int productId}) async {
    try {
      Response response = await _dio.get(
        Api.productComment,
        queryParameters: {'product_id': productId},
      );

      List<ProductComment> productComments = response.data
          .map<ProductComment>((e) => ProductComment.fromMapJson(e))
          .toList();

      return productComments;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
