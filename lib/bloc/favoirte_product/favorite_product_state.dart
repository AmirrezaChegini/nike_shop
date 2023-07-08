import 'package:equatable/equatable.dart';
import 'package:nike_shop/models/product.dart';

abstract class FavoriteProductState extends Equatable {}

class InitFavoriteProductState extends FavoriteProductState {
  @override
  List<Object?> get props => [];
}

class CompletedFavoriteProductState extends FavoriteProductState {
  final List<Product> productList;
  CompletedFavoriteProductState(this.productList);
  @override
  List<Object?> get props => [productList];
}

class EmptyFavoriteProductState extends FavoriteProductState {
  final String message;
  EmptyFavoriteProductState(this.message);
  @override
  List<Object?> get props => [message];
}
