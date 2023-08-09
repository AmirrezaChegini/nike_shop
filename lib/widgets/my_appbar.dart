import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColor.white,
      elevation: 1,
      leading: leading,
      titleSpacing: 0,
      centerTitle: centerTitle,
      actions: actions,
      title: Text(
        title,
        maxLines: 1,
        style: const TextStyle(
          fontFamily: 'iranyekan',
          fontSize: 18,
          color: MyColor.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
