import 'package:nike_shop/models/product.dart';

abstract class FavoriteProductEvent {}

class GetAllFavoriteProducts extends FavoriteProductEvent {}

class FavoriteProductAction extends FavoriteProductEvent {
  final Product product;
  FavoriteProductAction(this.product);
}
