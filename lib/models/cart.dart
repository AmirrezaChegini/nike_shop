class Cart {
  int _cartId;
  int _id;
  String _title;
  int _price;
  int _discount;
  String _image;
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
