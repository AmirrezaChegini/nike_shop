import 'package:equatable/equatable.dart';
import 'package:nike_shop/models/my_banner.dart';
import 'package:nike_shop/models/product.dart';

abstract class HomeState extends Equatable {}

class LoadingHomeState extends HomeState {
  @override
  List<Object?> get props => [];
}

class CompleteHomeState extends HomeState {
  final List<MyBanner> bannerList;
  final List<Product> latestProductList;
  final List<Product> toppestProductList;

  CompleteHomeState(
    this.bannerList,
    this.latestProductList,
    this.toppestProductList,
  );

  @override
  List<Object?> get props => [latestProductList, toppestProductList];
}

class FailedHomeState extends HomeState {
  final String errorMessage;
  FailedHomeState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
