import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/fab_cubit.dart';
import 'package:nike_shop/pages/shopping/widgets/cart_item.dart';
import 'package:nike_shop/pages/shopping/widgets/shopping_detail.dart';
import 'package:nike_shop/widgets/fab.dart';
import 'package:nike_shop/widgets/my_appbar.dart';
import 'package:nike_shop/widgets/refresh_btn.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.grey300,
      appBar: const MyAppbar(
        title: 'سبد خرید',
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<FabShopCubit, bool>(
        builder: (context, state) => Visibility(
          visible: state,
          child: Fab(
            title: 'ادامه فرایند خرید',
            ontap: () {},
          ),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is DataCartState) {
            BlocProvider.of<FabShopCubit>(context).hideFab(true);
          } else {
            BlocProvider.of<FabShopCubit>(context).hideFab(false);
          }
        },
        builder: (context, state) {
          if (state is FailedCartState) {
            return Center(
              child: RefreshBtn(
                onTap: () {},
              ),
            );
          }

          if (state is UnAuthCartState) {
            return Center(child: Text(state.message));
          }

          if (state is EmptyCartState) {
            return Center(child: Text(state.message));
          }

          if (state is DataCartState) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.cartList.length,
                    (context, index) => CartItem(
                      cart: state.cartList[index],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'جزییات خرید',
                      style: TextStyle(
                        color: MyColor.grey,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ShoppingDetail(
                    cartList: state.cartList,
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
