import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/order/order_bloc.dart';
import 'package:nike_shop/bloc/order/order_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/profile_cubit.dart';
import 'package:nike_shop/widgets/my_appbar.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: MyAppbar(
        title: 'سفارشات',
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<NavigatorCubit>(context).navigate(1);
          },
          color: MyColor.black,
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is InitOrderState) {
            return const SizedBox();
          }

          if (state is EmptyOrderState) {
            return Center(child: Text(state.message));
          }

          if (state is CompletedOrderState) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.orderList.length,
                    (context, index) => OrderItem(
                      order: state.orderList[index],
                    ),
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
