// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteProductAdapter extends TypeAdapter<FavoriteProduct> {
  @override
  final int typeId = 0;

  @override
  FavoriteProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteProduct(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as String,
      fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteProduct obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.prePrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
