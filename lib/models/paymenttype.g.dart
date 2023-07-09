// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymenttype.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentTypeAdapter extends TypeAdapter<PaymentType> {
  @override
  final int typeId = 1;

  @override
  PaymentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PaymentType.error;
      case 1:
        return PaymentType.success;
      case 2:
        return PaymentType.waiting;
      default:
        return PaymentType.error;
    }
  }

  @override
  void write(BinaryWriter writer, PaymentType obj) {
    switch (obj) {
      case PaymentType.error:
        writer.writeByte(0);
        break;
      case PaymentType.success:
        writer.writeByte(1);
        break;
      case PaymentType.waiting:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
