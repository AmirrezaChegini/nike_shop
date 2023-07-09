import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/payment_type.dart';
import 'package:nike_shop/pages/auth/widgets/text_btn.dart';
import 'package:nike_shop/widgets/my_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class RecieptPaymentPage extends StatelessWidget {
  const RecieptPaymentPage({
    super.key,
    required this.paymentPrice,
    required this.message,
    required this.paymentType,
  });

  final int paymentPrice;
  final String message;
  final PaymentType paymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: const MyAppbar(
        title: 'رسید پرداخت',
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 20,
                  color: MyColor.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('وضعیت سفارش'),
                  Text(paymentType == PaymentType.success
                      ? 'انجام شده'
                      : paymentType == PaymentType.waiting
                          ? 'در انتظار تایید'
                          : 'ناموفق'),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('مبلغ'),
                  Text('${'$paymentPrice'.toPersianDigit().seRagham()} تومان'),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextBtn(
                      backgroundColor: MyColor.white,
                      foregroundColor: MyColor.blue,
                      radius: 5,
                      child: const Text('سوابق سفارش'),
                      ontap: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextBtn(
                      backgroundColor: MyColor.blue,
                      foregroundColor: MyColor.white,
                      radius: 5,
                      child: const Text(' صفحه اصلی'),
                      ontap: () {
                        Navigator.pop(context);
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
