import 'package:dio/dio.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';

class CheckExceptions {
  static dynamic validate(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadReqEx(message: response.data['message']);
      case 401:
        throw UnAuthorizedEx(message: response.data['message']);
      case 404:
        throw NotFoundEx(message: response.statusMessage);
      case 422:
        throw AuthEx(message: response.data['message']);
      case 500:
        throw ServerEx(message: response.statusMessage);
      default:
        throw FetchDataEx(message: response.statusMessage);
    }
  }
}
