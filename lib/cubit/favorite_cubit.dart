import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/data/repositories/favorite_product_repository.dart';
import 'package:nike_shop/models/product.dart';

class FavoriteCubit extends Cubit<bool> {
  final IFavoriteProductRepository _repository;
  FavoriteCubit(this._repository) : super(false);

  void checkFavorite(Product product) {
    List<Product> productList = _repository.getProducts();
    List<Product> findProduct =
        productList.where((element) => element.id == product.id).toList();

    if (findProduct.isEmpty) {
      emit(false);
    } else {
      emit(true);
    }
  }
}
