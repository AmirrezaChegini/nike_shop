import 'package:dartz/dartz.dart';
import 'package:nike_shop/data/datasource/auth_datasource.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/auth_token.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';
import 'package:nike_shop/utils/shared_pref.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(String email, String password);
  Future<Either<String, String>> login(String username, String password);
  Future<Either<String, String>> refreshToken(String refreshToken);
}

class AuthRepository implements IAuthRepository {
  final AuthDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(String email, String password) async {
    try {
      await _datasource.register(email, password);
      return right('ثبت نام با موفقیت انجام شد');
    } on AppExceptions catch (ex) {
      return left(ex.message);
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      await SharedPref.saveString(key: 'username', value: username);
      AuthToken authToken = await _datasource.login(username, password);
      await SharedPref.saveString(
        key: 'token',
        value: authToken.token,
      );
      await SharedPref.saveString(
        key: 'refreshToken',
        value: authToken.refreshToken,
      );

      return right(' ورود با موفقیت انجام شد');
    } on AppExceptions catch (ex) {
      return left(ex.message);
    }
  }

  @override
  Future<Either<String, String>> refreshToken(String refreshToken) async {
    try {
      AuthToken authToken = await _datasource
          .refreshToken(SharedPref.getString(key: 'refreshToken'));

      await SharedPref.saveString(
        key: 'token',
        value: authToken.token,
      );
      await SharedPref.saveString(
        key: 'refreshToken',
        value: authToken.refreshToken,
      );
      return right(' ورود با موفقیت انجام شد');
    } on AppExceptions catch (ex) {
      return left(ex.message);
    }
  }
}
