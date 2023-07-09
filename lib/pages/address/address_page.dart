import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/payment/payment_bloc.dart';
import 'package:nike_shop/bloc/payment/payment_event.dart';
import 'package:nike_shop/bloc/payment/payment_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/models/payment_type.dart';
import 'package:nike_shop/pages/auth/widgets/text_btn.dart';
import 'package:nike_shop/pages/reciept_payment/reciept_payment.dart';
import 'package:nike_shop/pages/shopping/widgets/shopping_detail.dart';
import 'package:nike_shop/utils/extensions/discount_price.dart';
import 'package:nike_shop/utils/extensions/total_price.dart';
import 'package:nike_shop/widgets/edt_text.dart';
import 'package:nike_shop/widgets/loading_anim.dart';
import 'package:nike_shop/widgets/my_appbar.dart';

// ignore: must_be_immutable
class AddressPage extends StatefulWidget {
  const AddressPage({
    super.key,
    required this.cartList,
  });
  final List<Cart> cartList;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String name = '';
  String postalCode = '';
  String phone = '';
  String address = '';

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PaymentBloc>(context).add(InitPaymentEvent(
        widget.cartList.getTotalPrice() +
            widget.cartList.getTotalPrice().discount()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      resizeToAvoidBottomInset: false,
      appBar: const MyAppbar(
        title: 'انتخاب آدرس و شیوه پرداخت',
        leading: BackButton(
          color: MyColor.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    EdtText(
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      label: 'نام و نام خانوادگی',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'نام خود را وارد کنید';
                        }
                        name = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    EdtText(
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      label: 'کد پستی',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'کدپستی خود را وارد کنید';
                        }
                        postalCode = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    EdtText(
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      label: 'شماره تلفن',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'شماره تلفن خود را وارد کنید';
                        }
                        if (value.length != 11) {
                          return 'شماره تلفن اشتباه است';
                        }
                        phone = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    EdtText(
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.done,
                      label: 'آدرس تحویل گیرنده',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'آدرس خود را وارد کنید';
                        }
                        address = value;
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ShoppingDetail(cartList: widget.cartList),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextBtn(
                      backgroundColor: MyColor.white,
                      foregroundColor: MyColor.blue,
                      height: 50,
                      radius: 5,
                      child: const Text('پرداخت در محل'),
                      ontap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecieptPaymentPage(
                              paymentPrice: widget.cartList.getTotalPrice() +
                                  widget.cartList.getTotalPrice().discount(),
                              paymentType: PaymentType.waiting,
                              message: 'پرداخت با موفقیت انجام شد',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextBtn(
                      backgroundColor: MyColor.blue,
                      foregroundColor: MyColor.white,
                      height: 50,
                      radius: 5,
                      child: BlocConsumer<PaymentBloc, PaymentState>(
                        listener: (context, state) {
                          if (state is CompletedPaymentState) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecieptPaymentPage(
                                    paymentPrice:
                                        widget.cartList.getTotalPrice() +
                                            widget.cartList
                                                .getTotalPrice()
                                                .discount(),
                                    message: state.message,
                                    paymentType: state.paymentType),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is InitPaymentState) {
                            return const Text('پرداخت اینترنتی');
                          }

                          if (state is LoadingPaymentState) {
                            return const LoadingAnim(color: MyColor.white);
                          }

                          if (state is CompletedPaymentState) {
                            return const Text('پرداخت اینترنتی');
                          }

                          return const SizedBox();
                        },
                      ),
                      ontap: () async {
                        BlocProvider.of<PaymentBloc>(context)
                            .add(SendPaymentEvent());
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
