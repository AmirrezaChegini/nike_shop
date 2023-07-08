import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/pages/auth/widgets/text_btn.dart';
import 'package:nike_shop/pages/reciept_payment/reciept_payment.dart';
import 'package:nike_shop/pages/shopping/widgets/shopping_detail.dart';
import 'package:nike_shop/utils/extensions/total_price.dart';
import 'package:nike_shop/widgets/edt_text.dart';
import 'package:nike_shop/widgets/my_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AddressPage extends StatelessWidget {
  AddressPage({
    super.key,
    required this.cartList,
  });
  final List<Cart> cartList;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String name = '';
  String postalCode = '';
  String phone = '';
  String address = '';

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
              ShoppingDetail(cartList: cartList),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextBtn(
                      backgroundColor: MyColor.white,
                      foregroundColor: MyColor.blue,
                      radius: 5,
                      child: const Text('پرداخت در محل'),
                      ontap: () {
                        if (_globalKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecieptPaymentPage(
                                paymentPrice: cartList.getTotalPrice(),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextBtn(
                      backgroundColor: MyColor.blue,
                      foregroundColor: MyColor.white,
                      radius: 5,
                      child: const Text('پرداخت اینترنتی'),
                      ontap: () async {
                        await launchUrl(
                          mode: LaunchMode.externalApplication,
                          Uri.parse(
                              'http://expertdevelopers.ir/payment?order_id=5143'),
                        );
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
