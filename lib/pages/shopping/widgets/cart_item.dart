import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_event.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.32,
        child: Card(
          color: MyColor.white,
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        width: 80,
                        imageUrl: cart.image,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          cart.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'iranyekan',
                            color: MyColor.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            const Text(
                              'تعداد',
                              style: TextStyle(
                                color: MyColor.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CartBloc>(context).add(
                                        ChangeCountCartEvent(
                                            cart.cartId, cart.count + 1));
                                  },
                                  child: const Icon(Icons.add_box_outlined),
                                ),
                                Text(
                                  '${cart.count}'.toPersianDigit(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CartBloc>(context).add(
                                        ChangeCountCartEvent(
                                            cart.cartId, cart.count - 1));
                                  },
                                  child: const Icon(
                                      Icons.indeterminate_check_box_outlined),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${'${cart.price + cart.discount}'.toPersianDigit().seRagham()} تومان',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              '${'${cart.price}'.toPersianDigit().seRagham()} تومان',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: MyColor.black,
                  thickness: 0.4,
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(RemoveCartEvent(cart.cartId));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: MyColor.black,
                      backgroundColor: MyColor.white,
                      minimumSize: const Size.fromHeight(40)),
                  child: const Text('حذف از سبد خرید'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
