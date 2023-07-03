import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColor.white,
      elevation: 0,
      title: Image.asset('assets/images/nike_logo.png', width: 80),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
