import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_event.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/favorite_cubit.dart';
import 'package:nike_shop/models/product.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 56,
      expandedHeight: 230,
      backgroundColor: MyColor.transparent,
      foregroundColor: MyColor.black,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<FavoriteProductBloc>(context)
                  .add(FavoriteProductAction(product));
            },
            child: BlocBuilder<FavoriteCubit, bool>(
              builder: (context, state) => state == true
                  ? const Icon(
                      Icons.favorite,
                      color: MyColor.blue,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
      leading: const BackButton(),
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: product.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
