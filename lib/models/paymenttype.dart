import 'package:hive/hive.dart';

part 'paymenttype.g.dart';

@HiveType(typeId: 1)
enum PaymentType {
  @HiveField(0)
  error,
  @HiveField(1)
  success,
  @HiveField(2)
  waiting,
}
