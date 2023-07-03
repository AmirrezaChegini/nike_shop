import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/widgets/my_badge.dart';

class ProductListAppBar extends StatelessWidget {
  const ProductListAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: MyColor.white,
      elevation: 0,
      forceElevated: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is DataCartState) {
                return MyBadge(
                  label: '${state.cartList.length}',
                  widget: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                    color: MyColor.black,
                  ),
                );
              } else {
                return const Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: MyColor.black,
                );
              }
            },
          ),
        ),
      ],
      leading: const BackButton(
        color: MyColor.black,
      ),
      title: const Text(
        'کفش های ورزشی',
        style: TextStyle(
          fontFamily: 'iranyekan',
          fontSize: 18,
          color: MyColor.black,
        ),
      ),
    );
  }
}
