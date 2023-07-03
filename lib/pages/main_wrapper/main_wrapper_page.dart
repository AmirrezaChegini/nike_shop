import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_event.dart';
import 'package:nike_shop/bloc/home/home_bloc.dart';
import 'package:nike_shop/bloc/home/home_event.dart';
import 'package:nike_shop/cubit/auth_cubit.dart';
import 'package:nike_shop/cubit/bottom_navbar_cubit.dart';
import 'package:nike_shop/pages/auth/auth_page.dart';
import 'package:nike_shop/pages/home/home_page.dart';
import 'package:nike_shop/pages/main_wrapper/widgets/bottom_navbar.dart';
import 'package:nike_shop/pages/profile/profile_page.dart';
import 'package:nike_shop/pages/shopping/shopping_page.dart';

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(HomeEvent());
    BlocProvider.of<CartBloc>(context).add(GetAllCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        int index = BlocProvider.of<BottomNavbarCubit>(context).state;
        if (index == 0) {
          SystemNavigator.pop();
        } else {
          BlocProvider.of<BottomNavbarCubit>(context).changeIndex(0);
        }
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: BlocBuilder<BottomNavbarCubit, int>(
          builder: (context, state) => IndexedStack(
            index: state,
            children: [
              HomePage(),
              const ShoppingPage(),
              BlocBuilder<AuthCubit, bool>(
                builder: (context, state) =>
                    state ? const ProfilePage() : const AuthPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
