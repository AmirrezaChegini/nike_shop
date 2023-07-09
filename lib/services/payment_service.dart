import 'package:nike_shop/bloc/payment/payment_bloc.dart';
import 'package:nike_shop/bloc/payment/payment_state.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/models/payment_type.dart';
import 'package:nike_shop/utils/extensions/payment_res.dart';
import 'package:nike_shop/utils/url_launcher.dart';
import 'package:uni_links/uni_links.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentService {
  void initPaymentrequest(int amount);
  void sendPaymentrequest();
  void verifyPaymentrequest(String status, String authority);
}

class ZarinpalPayment implements PaymentService {
  final PaymentRequest _paymentRequest;
  ZarinpalPayment(this._paymentRequest);

  @override
  void initPaymentrequest(int amount) {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setMerchantID('111122223333444455556666777788889999');
    _paymentRequest.setCallbackURL('amirrezagu://nikeshop');
    _paymentRequest.setAmount(amount);
    _paymentRequest.setDescription('برای خرید اینترنتی از نایک شاپ');

    linkStream.listen((deepLink) {
      verifyPaymentrequest(deepLink!.getStatus(), deepLink.getAuthority());
    });
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
  void verifyPaymentrequest(String status, String authority) {
    PaymentBloc paymentBloc = locator.get();
    ZarinPal().verificationPayment(status, authority, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      if (isPaymentSuccess) {
        // ignore: invalid_use_of_visible_for_testing_member
        paymentBloc.emit(CompletedPaymentState(
            'پرداخت با موفقیت انجام شد', PaymentType.success));
      } else {
        paymentBloc
            // ignore: invalid_use_of_visible_for_testing_member
            .emit(CompletedPaymentState('پرداخت انجام نشد', PaymentType.error));
      }
    });
  }
}
