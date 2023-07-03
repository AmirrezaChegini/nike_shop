import 'package:dartz/dartz.dart';
import 'package:nike_shop/data/datasource/cart_datasource.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';

abstract class ICartRepository {
  Future<Either<String, String>> addCart({required int productId});
  Future<Either<String, String>> removeCart({required int cartId});
  Future<Either<String, List<Cart>>> getCarts();
  Future<Either<String, String>> changeCountCart(
      {required int cartId, required int count});
}

class CartRepositoy implements ICartRepository {
  final CartDatasource _datasource = locator.get();
  @override
  Future<Either<String, String>> addCart({required int productId}) async {
    try {
      await _datasource.addCart(productId: productId);
      return right('به سبد خرید اضافه شد');
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, String>> removeCart({required int cartId}) async {
    try {
      await _datasource.removeCart(cartId: cartId);
      return right('از سبد خرید حذف شد');
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, String>> changeCountCart(
      {required int cartId, required int count}) async {
    try {
      await _datasource.changeCountCart(cartId: cartId, count: count);
      return right('انجام شد');
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, List<Cart>>> getCarts() async {
    try {
      List<Cart> carts = await _datasource.getCarts();
      return right(carts);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }
}
