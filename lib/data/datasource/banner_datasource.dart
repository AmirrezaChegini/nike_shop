import 'package:dio/dio.dart';
import 'package:nike_shop/constants/api.dart';
import 'package:nike_shop/models/my_banner.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';
import 'package:nike_shop/utils/error_handler/check_exceptions.dart';

abstract class BannerDatasource {
  Future<List<MyBanner>> getBanners();
}

class BannerRemote implements BannerDatasource {
  BannerRemote(this._dio);

  final Dio _dio;

  @override
  Future<List<MyBanner>> getBanners() async {
    try {
      Response response = await _dio.get(Api.banners);

      List<MyBanner> banners =
          response.data.map<MyBanner>((e) => MyBanner.fromMapJson(e)).toList();

      return banners;
    } on DioError catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
