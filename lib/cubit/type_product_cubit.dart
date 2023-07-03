import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/models/product.dart';

class TypeProductCubit extends Cubit<TypeProduct> {
  TypeProductCubit() : super(TypeProduct.all);

  void changeTypeProduct(TypeProduct typeProduct) {
    emit(typeProduct);
  }
}
