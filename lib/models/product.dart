import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  int _id;
  @HiveField(1)
  String _title;
  @HiveField(2)
  int _price;
  @HiveField(3)
  int _discount;
  @HiveField(4)
  String _image;
  @HiveField(5)
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
