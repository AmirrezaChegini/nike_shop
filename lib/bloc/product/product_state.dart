import 'package:equatable/equatable.dart';
import 'package:nike_shop/models/product.dart';

abstract class ProductState extends Equatable {}

class InitProductState extends ProductState {
  @override
  List<Object?> get props => [];
}

class CompletedProductState extends ProductState {
  final List<Product> productList;
  CompletedProductState(this.productList);

  @override
  List<Object?> get props => [productList];
}

class FailedProductState extends ProductState {
  final String errorMessage;
  FailedProductState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
