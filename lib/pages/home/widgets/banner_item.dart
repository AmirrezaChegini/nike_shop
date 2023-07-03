import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/models/my_banner.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.banner});

  final MyBanner banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: banner.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
