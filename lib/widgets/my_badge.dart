import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({
    super.key,
    required this.widget,
    required this.label,
  });

  final Widget widget;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: MyColor.blue,
      isLabelVisible: true,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      largeSize: 17,
      offset: const Offset(15, -3),
      label: Text(
        label.toPersianDigit(),
        style: const TextStyle(
          color: MyColor.white,
          decoration: TextDecoration.none,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: widget,
    );
  }
}
