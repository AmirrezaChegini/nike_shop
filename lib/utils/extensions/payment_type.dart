import 'package:nike_shop/models/paymenttype.dart';

extension Paymenttype on PaymentType {
  String getPaymentString() {
    PaymentType paymentType = this;
    switch (paymentType) {
      case PaymentType.success:
        return 'انجام شده';
      case PaymentType.waiting:
        return 'در انتظار تایید';
      case PaymentType.error:
        return 'ناموفق';
      default:
        return '';
    }
  }
}
