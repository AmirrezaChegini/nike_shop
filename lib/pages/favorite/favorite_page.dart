import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/profile_cubit.dart';
import 'package:nike_shop/widgets/my_appbar.dart';
import 'package:nike_shop/widgets/product_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'علاقه مندی ها',
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<NavigatorCubit>(context).navigate(1);
          },
          color: MyColor.black,
        ),
      ),
      body: BlocBuilder<FavoriteProductBloc, FavoriteProductState>(
        builder: (context, state) {
          if (state is CompletedFavoriteProductState) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 5),
                  sliver: SliverGrid.builder(
                    itemCount: state.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.8,
                    ),
                    itemBuilder: (context, index) =>
                        ProductItem(product: state.productList[index]),
                  ),
                )
              ],
            );
          }

          if (state is EmptyFavoriteProductState) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
