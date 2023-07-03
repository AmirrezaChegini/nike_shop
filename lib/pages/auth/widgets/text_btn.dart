import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.child,
    required this.ontap,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Widget child;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: const TextStyle(
          fontFamily: 'iranyekan',
          fontSize: 16,
        ),
      ),
      child: child,
    );
  }
}
