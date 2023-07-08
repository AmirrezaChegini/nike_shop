import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_event.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_state.dart';
import 'package:nike_shop/cubit/favorite_cubit.dart';
import 'package:nike_shop/data/repositories/favorite_product_repository.dart';
import 'package:nike_shop/models/product.dart';

class FavoriteProductBloc
    extends Bloc<FavoriteProductEvent, FavoriteProductState> {
  final IFavoriteProductRepository _repository;
  FavoriteCubit favoriteCubit;

  FavoriteProductBloc(this._repository, this.favoriteCubit)
      : super(InitFavoriteProductState()) {
    on<GetAllFavoriteProducts>((event, emit) {
      List<Product> productList = _repository.getProducts();
      emit(productList.isEmpty
          ? EmptyFavoriteProductState('لیست علاقه مندی ها خالی می باشد')
          : CompletedFavoriteProductState(productList));
    });
    on<FavoriteProductAction>((event, emit) async {
      List<Product> productList = _repository.getProducts();
      List<Product> findProduct = productList
          .where((element) => element.id == event.product.id)
          .toList();

      if (findProduct.isEmpty) {
        await _repository.addProduct(event.product);
        favoriteCubit.checkFavorite(event.product);
      } else {
        await _repository.removeProduct(event.product);
        favoriteCubit.checkFavorite(event.product);
      }

      List<Product> productsList = _repository.getProducts();
      emit(productsList.isEmpty
          ? EmptyFavoriteProductState('لیست علاقه مندی ها خالی می باشد')
          : CompletedFavoriteProductState(productsList));
    });
  }
}
