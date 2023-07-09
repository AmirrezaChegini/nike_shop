import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/models/order.dart';
import 'package:nike_shop/utils/extensions/payment_type.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    order.products.length,
                    (index) => CachedNetworkImage(
                      height: 55,
                      width: 55,
                      fit: BoxFit.cover,
                      imageUrl: order.products[index].image,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text('${order.amount}'.toPersianDigit().seRagham()),
                    const Text('تومان'),
                    const Spacer(),
                    Text(order.paymentType.getPaymentString()),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
