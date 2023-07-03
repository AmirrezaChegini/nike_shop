import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nike_shop/data/datasource/auth_datasource.dart';
import 'package:nike_shop/data/datasource/banner_datasource.dart';
import 'package:nike_shop/data/datasource/cart_datasource.dart';
import 'package:nike_shop/data/datasource/product_comment_datasource.dart';
import 'package:nike_shop/data/datasource/products_datasource.dart';
import 'package:nike_shop/data/repositories/auth_repository.dart';
import 'package:nike_shop/data/repositories/banner_repository.dart';
import 'package:nike_shop/data/repositories/cart_repository.dart';
import 'package:nike_shop/data/repositories/product_comment_repository.dart';
import 'package:nike_shop/data/repositories/products_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;

Future<void> initLocator() async {
  //* classes
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: 'http://expertdevelopers.ir/api/v1/',
      connectTimeout: const Duration(seconds: 5),
    ),
  ));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //* datasources
  locator.registerSingleton<BannerDatasource>(BannerRemote());
  locator.registerSingleton<ProductsDatasource>(ProductsRemote());
  locator.registerSingleton<AuthDatasource>(AuthRemote());
  locator.registerSingleton<ProductCommentDatasource>(ProductCommentRemote());
  locator.registerSingleton<CartDatasource>(CartRemote());

  //* repositories
  locator.registerSingleton<IBannerRepository>(BannerRepository());
  locator.registerSingleton<IProductsRepository>(ProductsRepository());
  locator.registerSingleton<IAuthRepository>(AuthRepository());
  locator
      .registerSingleton<IProductCommentRepository>(ProductCommentRepository());
  locator.registerSingleton<ICartRepository>(CartRepositoy());
}
