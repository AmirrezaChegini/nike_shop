import 'package:dio/dio.dart';
import 'package:nike_shop/constants/api.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';
import 'package:nike_shop/utils/error_handler/check_exceptions.dart';
import 'package:nike_shop/utils/shared_pref.dart';

abstract class CartDatasource {
  Future<void> addCart({required int productId});
  Future<void> removeCart({required int cartId});
  Future<List<Cart>> getCarts();
  Future<void> changeCountCart({required int cartId, required int count});
}

class CartRemote implements CartDatasource {
  CartRemote(this._dio);

  final Dio _dio;

  @override
  Future<void> addCart({required int productId}) async {
    try {
      await _dio.post(
        Api.addCart,
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Bearer ${SharedPref.getString(key: 'token')}'
          },
        ),
        data: {
          'product_id': productId,
        },
      );
    } on DioError catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<void> removeCart({required int cartId}) async {
    try {
      await _dio.post(
        Api.removeCart,
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Bearer ${SharedPref.getString(key: 'token')}'
          },
        ),
        data: {
          'cart_item_id': cartId,
        },
      );
    } on DioError catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<void> changeCountCart(
      {required int cartId, required int count}) async {
    try {
      await _dio.post(
        Api.changeCountCart,
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Bearer ${SharedPref.getString(key: 'token')}'
          },
        ),
        data: {
          'cart_item_id': cartId,
          'count': count,
        },
      );
    } on DioError catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<List<Cart>> getCarts() async {
    try {
      Response response = await _dio.get(
        Api.getCarts,
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Bearer ${SharedPref.getString(key: 'token')}'
          },
        ),
      );

      List<Cart> carts = response.data['cart_items']
          .map<Cart>((e) => Cart.fromMapJson(e))
          .toList();

      return carts;
    } on DioError catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
