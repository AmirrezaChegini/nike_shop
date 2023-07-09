import 'package:equatable/equatable.dart';
import 'package:nike_shop/models/paymenttype.dart';

abstract class PaymentState extends Equatable {}

class InitPaymentState extends PaymentState {
  @override
  List<Object?> get props => [];
}

class LoadingPaymentState extends PaymentState {
  @override
  List<Object?> get props => [];
}

class CompletedPaymentState extends PaymentState {
  final String message;
  final PaymentType paymentType;
  CompletedPaymentState(this.message, this.paymentType);
  @override
  List<Object?> get props => [message, paymentType];
}
