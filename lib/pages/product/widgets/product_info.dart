import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.title,
    required this.price,
    required this.prePrice,
  });
  final String title;
  final int price;
  final int prePrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$prePrice تومان'.toPersianDigit().seRagham(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '$price تومان'.toPersianDigit().seRagham(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
