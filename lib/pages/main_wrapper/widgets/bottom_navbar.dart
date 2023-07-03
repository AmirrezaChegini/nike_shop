import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_state.dart';
import 'package:nike_shop/cubit/bottom_navbar_cubit.dart';
import 'package:nike_shop/widgets/my_badge.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, int>(
      builder: (context, state) => BottomNavigationBar(
        currentIndex: state,
        onTap: (value) {
          BlocProvider.of<BottomNavbarCubit>(context).changeIndex(value);
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is DataCartState) {
                  return MyBadge(
                    label: '${state.cartList.length}',
                    widget: const Icon(Icons.shopping_bag_outlined),
                  );
                } else {
                  return const Icon(Icons.shopping_bag_outlined);
                }
              },
            ),
            label: 'سبد خرید',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'حساب کاربری',
          ),
        ],
      ),
    );
  }
}
