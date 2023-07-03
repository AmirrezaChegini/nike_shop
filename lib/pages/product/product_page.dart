import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_event.dart';
import 'package:nike_shop/bloc/cart/cart_state.dart';
import 'package:nike_shop/bloc/comment/comment_bloc.dart';
import 'package:nike_shop/bloc/comment/comment_event.dart';
import 'package:nike_shop/bloc/comment/comment_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/fab_cubit.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/pages/product/widgets/comment_item.dart';
import 'package:nike_shop/pages/product/widgets/product_appbar.dart';
import 'package:nike_shop/pages/product/widgets/product_desc.dart';
import 'package:nike_shop/pages/product/widgets/product_info.dart';
import 'package:nike_shop/widgets/anim/slide_fade_down_anim.dart';
import 'package:nike_shop/widgets/fab.dart';
import 'package:nike_shop/widgets/loading_anim.dart';
import 'package:nike_shop/widgets/my_snackbar.dart';
import 'package:nike_shop/widgets/refresh_btn.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ScrollController _scrollCtrl = ScrollController();
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(() {
      hideFab();
    });
  }

  Future<void> hideFab() async {
    if (_scrollCtrl.position.pixels > _scrollCtrl.position.minScrollExtent) {
      BlocProvider.of<FabProductCubit>(context).hideFab(true);
    }
    if (_scrollCtrl.position.pixels < _scrollCtrl.position.maxScrollExtent) {
      BlocProvider.of<FabProductCubit>(context).hideFab(false);
    }
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is UnAuthCartState) {
            showMessage(context, state.message);
          }
          if (state is FailedCartState) {
            showMessage(context, state.errorMessage);
          }
          if (state is DataCartState) {
            showMessage(context, 'به سبد خرید افزوده شد');
          }
        },
        child: SlideFadeDownAnim(
          widget: Fab(
            title: 'افزودن به سبد خرید',
            ontap: () {
              BlocProvider.of<CartBloc>(context)
                  .add(AddCartEvent(widget.product.id));
            },
          ),
        ),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is LoadingCommentState) {
            return const Center(
              child: LoadingAnim(color: MyColor.dark),
            );
          }

          if (state is FailedCommentState) {
            return Center(child: RefreshBtn(
              onTap: () {
                BlocProvider.of<CommentBloc>(context)
                    .add(CommentEvent(widget.product.id));
              },
            ));
          }

          if (state is CompletedCommentState) {
            return NestedScrollView(
              controller: _scrollCtrl,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                ProductAppBar(
                  image: widget.product.image,
                ),
              ],
              body: Container(
                color: MyColor.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(
                      title: widget.product.title,
                      prePrice: widget.product.prePrice,
                      price: widget.product.price,
                    ),
                    const SizedBox(height: 15),
                    const ProductDesc(),
                    const SizedBox(height: 15),
                    const Text('نظرات کاربران'),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: MyColor.grey300,
                            width: 1,
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => CommentItem(
                            productComment: state.productCommentList[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
