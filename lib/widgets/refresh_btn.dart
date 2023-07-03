import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class RefreshBtn extends StatelessWidget {
  const RefreshBtn({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.refresh_rounded),
      label: const Text('اتصال دوباره'),
      style: TextButton.styleFrom(
        foregroundColor: MyColor.dark,
      ),
    );
  }
}
