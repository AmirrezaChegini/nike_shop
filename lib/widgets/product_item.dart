import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/comment/comment_bloc.dart';
import 'package:nike_shop/bloc/comment/comment_event.dart';
import 'package:nike_shop/cubit/favorite_cubit.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/pages/product/product_page.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CommentBloc>(context).add(CommentEvent(product.id));
        BlocProvider.of<FavoriteCubit>(context).checkFavorite(product);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                product: product,
              ),
            ));
      },
      child: SizedBox(
        width: 190,
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'iranyekan',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${product.prePrice}'.toPersianDigit().seRagham(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      '${product.price}'.toPersianDigit().seRagham(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
