// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartAdapter extends TypeAdapter<Cart> {
  @override
  final int typeId = 2;

  @override
  Cart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cart(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as int,
      fields[4] as int,
      fields[5] as String,
      fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Cart obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._cartId)
      ..writeByte(1)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._title)
      ..writeByte(3)
      ..write(obj._price)
      ..writeByte(4)
      ..write(obj._discount)
      ..writeByte(5)
      ..write(obj._image)
      ..writeByte(6)
      ..write(obj._count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
