import 'package:dartz/dartz.dart';
import 'package:nike_shop/data/datasource/product_comment_datasource.dart';
import 'package:nike_shop/models/product_comment.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';

abstract class IProductCommentRepository {
  Future<Either<String, List<ProductComment>>> getComments(
      {required int productId});
}

class ProductCommentRepository implements IProductCommentRepository {
  ProductCommentRepository(this._datasource);

  final ProductCommentDatasource _datasource;

  @override
  Future<Either<String, List<ProductComment>>> getComments(
      {required int productId}) async {
    try {
      List<ProductComment> productComments =
          await _datasource.getComments(productId: productId);
      return right(productComments);
    } on AppExceptions catch (ex) {
      return left(ex.message);
    }
  }
}
