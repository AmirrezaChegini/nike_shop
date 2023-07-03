import 'package:dartz/dartz.dart';
import 'package:nike_shop/data/datasource/banner_datasource.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/my_banner.dart';
import 'package:nike_shop/utils/error_handler/app_exceptions.dart';

abstract class IBannerRepository {
  Future<Either<String, List<MyBanner>>> getBanners();
}

class BannerRepository implements IBannerRepository {
  final BannerDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<MyBanner>>> getBanners() async {
    try {
      List<MyBanner> banners = await _datasource.getBanners();
      return right(banners);
    } on AppExceptions catch (ex) {
      return left(ex.message);
    }
  }
}
