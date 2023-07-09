abstract class PaymentEvent {}

class InitPaymentEvent extends PaymentEvent {
  final int amount;
  InitPaymentEvent(this.amount);
}

class SendPaymentEvent extends PaymentEvent {}

class VerifyPaymentEvent extends PaymentEvent {
  String status;
  String authority;

  VerifyPaymentEvent(this.status, this.authority);
}
