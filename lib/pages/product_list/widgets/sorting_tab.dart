import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/product/product_bloc.dart';
import 'package:nike_shop/bloc/product/product_event.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/type_product_cubit.dart';
import 'package:nike_shop/models/product.dart';

class SortingTab extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: 1,
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(right: 15),
        color: MyColor.white,
        child: Row(
          children: [
            BlocBuilder<TypeProductCubit, TypeProduct>(
              builder: (context, state) => DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: TypeProduct.all,
                    child: Text('همه'),
                  ),
                  DropdownMenuItem(
                    value: TypeProduct.latest,
                    child: Text('جدیدترین'),
                  ),
                  DropdownMenuItem(
                    value: TypeProduct.toppest,
                    child: Text('محبوب ترین'),
                  ),
                ],
                onChanged: (v) {
                  BlocProvider.of<ProductBloc>(context)
                      .add(GetProductsEvent(v!));
                  BlocProvider.of<TypeProductCubit>(context)
                      .changeTypeProduct(v);
                },
                icon: const Icon(Icons.sort),
                value: state,
                alignment: Alignment.center,
                underline: const SizedBox(),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
