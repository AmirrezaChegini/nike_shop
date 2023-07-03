import 'package:flutter/material.dart';
import 'package:nike_shop/models/product_comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.productComment,
  });

  final ProductComment productComment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productComment.title,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                productComment.date,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
          Text(
            productComment.author,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            productComment.content,
            maxLines: 5,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
