import 'package:nike_shop/utils/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentService {
  void initPaymentrequest(int amount);
  void sendPaymentrequest();
  bool verifyPaymentrequest(String status, String authority);
}

class ZarinpalPayment implements PaymentService {
  final PaymentRequest _paymentRequest;
  bool paymentSuccess = true;

  ZarinpalPayment(this._paymentRequest);

  @override
  void initPaymentrequest(int amount) {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setMerchantID('111122223333444455556666777788889999');
    _paymentRequest.setCallbackURL('amirrezagu://nikeshop');
    _paymentRequest.setAmount(amount);
    _paymentRequest.setDescription('برای خرید اینترنتی از نایک شاپ');
  }

  @override
  void sendPaymentrequest() {
    ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
      if (status == 100) {
        UrlLauncher.launch(paymentGatewayUri!);
      }
    });
  }

  @override
  bool verifyPaymentrequest(String status, String authority) {
    ZarinPal().verificationPayment(status, authority, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      paymentSuccess = isPaymentSuccess;
    });
    return paymentSuccess;
  }
}
