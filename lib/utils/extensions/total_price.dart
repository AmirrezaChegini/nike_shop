import 'package:nike_shop/models/cart.dart';

extension TotolPrice on List<Cart> {
  int getTotalPrice() {
    List<Cart> cartList = this;

    return cartList.fold(0, (i, e) => i + (e.price * e.count));
  }
}
