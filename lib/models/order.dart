import 'package:hive/hive.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/models/paymenttype.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
class Order {
  @HiveField(0)
  final PaymentType _paymentType;
  @HiveField(1)
  final int _amount;
  @HiveField(2)
  final List<Cart> _carts;

  Order(this._paymentType, this._amount, this._carts);

  PaymentType get paymentType => _paymentType;
  int get amount => _amount;
  List<Cart> get products => _carts;
}
