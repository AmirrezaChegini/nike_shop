import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/home/home_event.dart';
import 'package:nike_shop/bloc/home/home_state.dart';
import 'package:nike_shop/data/repositories/banner_repository.dart';
import 'package:nike_shop/data/repositories/products_repository.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/my_banner.dart';
import 'package:nike_shop/models/product.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final IProductsRepository _productsRepository = locator.get();

  HomeBloc() : super(LoadingHomeState()) {
    on<HomeEvent>((event, emit) async {
      emit(LoadingHomeState());

      List<MyBanner> banners = [];
      List<Product> latestProducts = [];
      List<Product> toppestProducts = [];
      String errorMessage = '';

      var bannersEither = await _bannerRepository.getBanners();
      bannersEither.fold((l) {
        errorMessage = l;
      }, (r) {
        banners = r;
      });

      var latestProductsEither = await _productsRepository.getProducts(
          typeProduct: TypeProduct.latest);
      latestProductsEither.fold((l) {
        errorMessage = l;
      }, (r) {
        latestProducts = r;
      });

      var toppestProductsEither = await _productsRepository.getProducts(
          typeProduct: TypeProduct.toppest);
      toppestProductsEither.fold((l) {
        errorMessage = l;
      }, (r) {
        toppestProducts = r;
      });

      if (errorMessage.isEmpty) {
        emit(CompleteHomeState(banners, latestProducts, toppestProducts));
      } else {
        emit(FailedHomeState(errorMessage));
      }
    });
  }
}
