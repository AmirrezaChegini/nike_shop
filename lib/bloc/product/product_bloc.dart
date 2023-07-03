import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/product/product_event.dart';
import 'package:nike_shop/bloc/product/product_state.dart';
import 'package:nike_shop/data/repositories/products_repository.dart';
import 'package:nike_shop/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductsRepository _productsRepository = locator.get();

  ProductBloc() : super(InitProductState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(InitProductState());
      await Future.delayed(const Duration(seconds: 1));
      var either =
          await _productsRepository.getProducts(typeProduct: event.typeProduct);

      either.fold((l) {
        emit(FailedProductState(l));
      }, (r) {
        emit(CompletedProductState(r));
      });
    });
  }
}
