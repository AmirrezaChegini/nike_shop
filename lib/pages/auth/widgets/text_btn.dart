import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.child,
    required this.ontap,
    this.height = 0,
    this.radius = 0,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Widget child;
  final double height;
  final double radius;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
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
