import 'package:hive/hive.dart';

part 'favorite_product.g.dart';

@HiveType(typeId: 0)
class FavoriteProduct extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int price;
  @HiveField(3)
  int discount;
  @HiveField(4)
  String image;
  @HiveField(5)
  int prePrice;

  FavoriteProduct(
    this.id,
    this.title,
    this.price,
    this.discount,
    this.image,
    this.prePrice,
  );
}
