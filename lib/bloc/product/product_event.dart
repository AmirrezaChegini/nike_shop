import 'package:nike_shop/models/product.dart';

abstract class ProductEvent {}

class GetProductsEvent extends ProductEvent {
  final TypeProduct typeProduct;
  GetProductsEvent(this.typeProduct);
}
