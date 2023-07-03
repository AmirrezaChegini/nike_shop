import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/product/product_bloc.dart';
import 'package:nike_shop/bloc/product/product_event.dart';
import 'package:nike_shop/bloc/product/product_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/widgets/loading_anim.dart';
import 'package:nike_shop/widgets/product_item.dart';
import 'package:nike_shop/pages/product_list/widgets/product_list_appbar.dart';
import 'package:nike_shop/pages/product_list/widgets/sorting_tab.dart';
import 'package:nike_shop/widgets/refresh_btn.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is InitProductState) {
            return const Center(child: LoadingAnim(color: MyColor.dark));
          }
          if (state is FailedProductState) {
            return Center(child: RefreshBtn(
              onTap: () {
                BlocProvider.of<ProductBloc>(context).add(GetProductsEvent(
                  title == 'جدیدترین'
                      ? TypeProduct.latest
                      : title == 'محبوب ترین'
                          ? TypeProduct.toppest
                          : TypeProduct.all,
                ));
              },
            ));
          }

          if (state is CompletedProductState) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  const ProductListAppBar(),
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: SortingTab(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 5),
                    sliver: SliverGrid.builder(
                      itemCount: state.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.8,
                      ),
                      itemBuilder: (context, index) => ProductItem(
                        product: state.productList[index],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
