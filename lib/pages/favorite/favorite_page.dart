import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/profile_cubit.dart';
import 'package:nike_shop/widgets/my_appbar.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 5),
            sliver: SliverGrid.builder(
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.8,
              ),
              itemBuilder: (context, index) => Container(
                color: MyColor.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
