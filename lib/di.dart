import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nike_shop/bloc/auth/auth_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/comment/comment_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_bloc.dart';
import 'package:nike_shop/bloc/home/home_bloc.dart';
import 'package:nike_shop/bloc/product/product_bloc.dart';
import 'package:nike_shop/cubit/favorite_cubit.dart';
import 'package:nike_shop/cubit/profile_cubit.dart';
import 'package:nike_shop/cubit/bottom_navbar_cubit.dart';
import 'package:nike_shop/cubit/edt_pass_cubti.dart';
import 'package:nike_shop/cubit/fab_cubit.dart';
import 'package:nike_shop/cubit/type_product_cubit.dart';
import 'package:nike_shop/data/datasource/auth_datasource.dart';
import 'package:nike_shop/data/datasource/banner_datasource.dart';
import 'package:nike_shop/data/datasource/cart_datasource.dart';
import 'package:nike_shop/data/datasource/favorite_product_datasource.dart';
import 'package:nike_shop/data/datasource/product_comment_datasource.dart';
import 'package:nike_shop/data/datasource/products_datasource.dart';
import 'package:nike_shop/data/repositories/auth_repository.dart';
import 'package:nike_shop/data/repositories/banner_repository.dart';
import 'package:nike_shop/data/repositories/cart_repository.dart';
import 'package:nike_shop/data/repositories/favorite_product_repository.dart';
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
  locator.registerSingleton<BannerDatasource>(BannerRemote(locator.get()));
  locator.registerSingleton<ProductsDatasource>(ProductsRemote(locator.get()));
  locator.registerSingleton<AuthDatasource>(AuthRemote(locator.get()));
  locator.registerSingleton<ProductCommentDatasource>(
      ProductCommentRemote(locator.get()));
  locator.registerSingleton<CartDatasource>(CartRemote(locator.get()));
  locator.registerSingleton<FavoriteProductDatasource>(FavoriteProductLocal());

  //* repositories
  locator.registerSingleton<IBannerRepository>(BannerRepository(locator.get()));
  locator.registerSingleton<IProductsRepository>(
      ProductsRepository(locator.get()));
  locator.registerSingleton<IAuthRepository>(AuthRepository(locator.get()));
  locator.registerSingleton<IProductCommentRepository>(
      ProductCommentRepository(locator.get()));
  locator.registerSingleton<ICartRepository>(CartRepositoy(locator.get()));
  locator.registerSingleton<IFavoriteProductRepository>(
      FavoriteProductRepository(locator.get()));

  //cubit
  locator.registerSingleton<EdtPassCubit>(EdtPassCubit());
  locator.registerSingleton<BottomNavbarCubit>(BottomNavbarCubit());
  locator.registerSingleton<TypeProductCubit>(TypeProductCubit());
  locator.registerSingleton<NavigatorCubit>(NavigatorCubit());
  locator.registerSingleton<FabProductCubit>(FabProductCubit());
  locator.registerSingleton<FabShopCubit>(FabShopCubit());
  locator.registerSingleton<FavoriteCubit>(FavoriteCubit(locator.get()));

  //bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator.get(), locator.get()));
  locator.registerSingleton<ProductBloc>(ProductBloc(locator.get()));
  locator.registerSingleton<LoginAuthBloc>(LoginAuthBloc(locator.get()));
  locator.registerSingleton<RegisterAuthBloc>(RegisterAuthBloc(locator.get()));
  locator.registerSingleton<CommentBloc>(CommentBloc(locator.get()));
  locator.registerSingleton<CartBloc>(CartBloc(locator.get()));
  locator.registerSingleton<FavoriteProductBloc>(
      FavoriteProductBloc(locator.get(), locator.get()));
}
