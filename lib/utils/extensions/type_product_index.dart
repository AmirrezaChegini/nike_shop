import 'package:nike_shop/models/product.dart';

extension TypeProductIndex on TypeProduct {
  int getIndex() {
    TypeProduct typeProduct = this;
    switch (typeProduct) {
      case TypeProduct.all:
        return 0;
      case TypeProduct.latest:
        return 1;
      case TypeProduct.toppest:
        return 2;
      default:
        return 0;
    }
  }
}
