class Product {
  int _id;
  String _title;
  int _price;
  int _discount;
  String _image;
  int _prePrice;

  Product(
    this._id,
    this._title,
    this._price,
    this._discount,
    this._image,
    this._prePrice,
  );

  factory Product.fromMapJson(Map<String, dynamic> jsonObject) {
    return Product(
      jsonObject['id'],
      jsonObject['title'],
      jsonObject['price'],
      jsonObject['discount'],
      jsonObject['image'],
      jsonObject['previous_price'],
    );
  }

  int get id => _id;
  String get title => _title;
  int get price => _price;
  int get discount => _discount;
  String get image => _image;
  int get prePrice => _prePrice;
}

enum TypeProduct { all, latest, toppest }
