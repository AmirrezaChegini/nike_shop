import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSmoothIndicator extends StatelessWidget {
  const BannerSmoothIndicator({
    super.key,
    required PageController pageCtrl,
  }) : _pageCtrl = pageCtrl;

  final PageController _pageCtrl;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageCtrl,
      count: 3,
      effect: ExpandingDotsEffect(
        dotColor: MyColor.grey300,
        activeDotColor: MyColor.grey,
        dotHeight: 3,
        dotWidth: 12,
        expansionFactor: 2,
      ),
    );
  }
}
