import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/home/home_bloc.dart';
import 'package:nike_shop/bloc/home/home_event.dart';
import 'package:nike_shop/bloc/home/home_state.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/my_banner.dart';
import 'package:nike_shop/models/product.dart';
import 'package:nike_shop/pages/home/widgets/banner_item.dart';
import 'package:nike_shop/pages/home/widgets/home_appbar.dart';
import 'package:nike_shop/widgets/loading_anim.dart';
import 'package:nike_shop/widgets/product_item.dart';
import 'package:nike_shop/pages/home/widgets/search_edttext.dart';
import 'package:nike_shop/pages/home/widgets/smooth_indicator.dart';
import 'package:nike_shop/pages/home/widgets/title_product.dart';
import 'package:nike_shop/widgets/refresh_btn.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _pageCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: const HomeAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingHomeState) {
            return const Center(child: LoadingAnim(color: MyColor.dark));
          }

          if (state is FailedHomeState) {
            return Center(
              child: RefreshBtn(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context).add(HomeEvent());
                },
              ),
            );
          }

          if (state is CompleteHomeState) {
            List<MyBanner> bannerList = state.bannerList;
            List<Product> latestProductList = state.latestProductList;
            List<Product> toppestProductList = state.toppestProductList;

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SearchEdtText(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          controller: _pageCtrl,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              BannerItem(banner: bannerList[index]),
                        ),
                        Positioned(
                          bottom: 10,
                          child: BannerSmoothIndicator(pageCtrl: _pageCtrl),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: TitlePoducts(title: 'جدیدترین'),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          ProductItem(product: latestProductList[index]),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: TitlePoducts(title: 'محبوب ترین'),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 4,
                      itemBuilder: (context, index) => ProductItem(
                        product: toppestProductList[index],
                      ),
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
