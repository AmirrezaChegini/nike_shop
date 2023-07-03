import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key, this.image = 'assets/images/nike_logo.png'});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 56,
      expandedHeight: 230,
      backgroundColor: MyColor.transparent,
      foregroundColor: MyColor.black,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.favorite_border),
        ),
      ],
      automaticallyImplyLeading: false,
      leading: const BackButton(),
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
