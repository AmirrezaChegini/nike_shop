import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/product/product_bloc.dart';
import 'package:nike_shop/bloc/product/product_event.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/type_product_cubit.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/pages/product_list/product_list_page.dart';

class TitlePoducts extends StatelessWidget {
  const TitlePoducts({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: MyColor.grey,
              fontSize: 14,
              fontFamily: 'iranyekan',
            ),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<ProductBloc>(context).add(
                GetProductsEvent(
                  title == 'جدیدترین'
                      ? TypeProduct.latest
                      : title == 'محبوب ترین'
                          ? TypeProduct.toppest
                          : TypeProduct.all,
                ),
              );
              BlocProvider.of<TypeProductCubit>(context).changeTypeProduct(
                title == 'جدیدترین'
                    ? TypeProduct.latest
                    : title == 'محبوب ترین'
                        ? TypeProduct.toppest
                        : TypeProduct.all,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListPage(
                      title: title,
                    ),
                  ));
            },
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                color: MyColor.blue,
                fontSize: 14,
                fontFamily: 'iranyekan',
              ),
            ),
            child: const Text('مشاهده همه'),
          ),
        ],
      ),
    );
  }
}
