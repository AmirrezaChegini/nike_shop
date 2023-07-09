import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/payment/payment_event.dart';
import 'package:nike_shop/bloc/payment/payment_state.dart';
import 'package:nike_shop/services/payment_service.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentService _paymentService;

  PaymentBloc(this._paymentService) : super(InitPaymentState()) {
    on<InitPaymentEvent>((event, emit) {
      emit(InitPaymentState());
      _paymentService.initPaymentrequest(event.amount);
    });

    on<SendPaymentEvent>((event, emit) async {
      emit(LoadingPaymentState());
      _paymentService.sendPaymentrequest();
    });
  }
}
