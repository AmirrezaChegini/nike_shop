import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/utils/extensions/discount_price.dart';
import 'package:nike_shop/utils/extensions/total_price.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ShoppingDetail extends StatelessWidget {
  const ShoppingDetail({
    super.key,
    required this.cartList,
    this.bottom = 0,
  });

  final List<Cart> cartList;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: bottom),
      child: Material(
        borderRadius: BorderRadius.circular(3),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مبلغ کل خرید',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '${'${cartList.getTotalPrice()}'.toPersianDigit().seRagham()} تومان',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Divider(thickness: 2),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'هزینه ارسال',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '${cartList.getTotalPrice().discount()}'
                        .toPersianDigit()
                        .seRagham(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Divider(thickness: 2),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مبلغ قابل پرداخت',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '${'${cartList.getTotalPrice() + cartList.getTotalPrice().discount()}'.toPersianDigit().seRagham()} تومان',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
