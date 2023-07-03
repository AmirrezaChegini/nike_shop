import 'package:dio/dio.dart';
import 'package:nike_shop/constants/api.dart';
import 'package:nike_shop/constants/api_post.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/auth_token.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';
import 'package:nike_shop/utils/error_handler/check_exceptions.dart';

abstract class AuthDatasource {
  Future<void> register(String email, String password);
  Future<AuthToken> login(String username, String password);
  Future<AuthToken> refreshToken(String refreshToken);
}

class AuthRemote implements AuthDatasource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(String email, String password) async {
    try {
      await _dio.post(
        Api.register,
        data: {
          'email': email,
          'password': password,
        },
      );
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<AuthToken> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        Api.login,
        data: {
          'grant_type': ApiPost.grantTypePass,
          'client_id': ApiPost.clientId,
          'client_secret': ApiPost.clientSecret,
          'username': username,
          'password': password
        },
      );

      AuthToken authToken = AuthToken(
        response.data['access_token'],
        response.data['refresh_token'],
      );

      return authToken;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<AuthToken> refreshToken(String refreshToken) async {
    try {
      Response response = await _dio.post(
        Api.refresh,
        data: {
          'grant_type': ApiPost.grantTypeRefresh,
          'client_id': ApiPost.clientId,
          'client_secret': ApiPost.clientSecret,
          'refresh_token': refreshToken,
        },
      );

      AuthToken authToken = AuthToken(
        response.data['access_token'],
        response.data['refresh_token'],
      );

      return authToken;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
