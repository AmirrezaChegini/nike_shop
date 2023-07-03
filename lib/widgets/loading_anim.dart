import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nike_shop/constants/my_color.dart';

class LoadingAnim extends StatelessWidget {
  const LoadingAnim({super.key, this.color = MyColor.white});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: 20,
    );
  }
}
