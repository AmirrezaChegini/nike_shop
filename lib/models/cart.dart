import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 2)
class Cart {
  @HiveField(0)
  int _cartId;
  @HiveField(1)
  int _id;
  @HiveField(2)
  String _title;
  @HiveField(3)
  int _price;
  @HiveField(4)
  int _discount;
  @HiveField(5)
  String _image;
  @HiveField(6)
  int _count;

  Cart(
    this._cartId,
    this._id,
    this._title,
    this._price,
    this._discount,
    this._image,
    this._count,
  );

  factory Cart.fromMapJson(Map<String, dynamic> jsonObject) {
    return Cart(
      jsonObject['cart_item_id'],
      jsonObject['product']['id'],
      jsonObject['product']['title'],
      jsonObject['product']['price'],
      jsonObject['product']['discount'],
      jsonObject['product']['image'],
      jsonObject['count'],
    );
  }

  int get cartId => _cartId;
  int get id => _id;
  String get title => _title;
  int get price => _price;
  int get discount => _discount;
  String get image => _image;
  int get count => _count;
}
