import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nike_shop/bloc/auth/auth_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/comment/comment_bloc.dart';
import 'package:nike_shop/bloc/favoirte_product/favorite_product_bloc.dart';
import 'package:nike_shop/bloc/home/home_bloc.dart';
import 'package:nike_shop/bloc/order/order_bloc.dart';
import 'package:nike_shop/bloc/payment/payment_bloc.dart';
import 'package:nike_shop/bloc/product/product_bloc.dart';
import 'package:nike_shop/configs/my_theme.dart';
import 'package:nike_shop/cubit/favorite_cubit.dart';
import 'package:nike_shop/cubit/profile_cubit.dart';
import 'package:nike_shop/cubit/bottom_navbar_cubit.dart';
import 'package:nike_shop/cubit/edt_pass_cubti.dart';
import 'package:nike_shop/cubit/fab_cubit.dart';
import 'package:nike_shop/cubit/type_product_cubit.dart';
import 'package:nike_shop/di.dart';
import 'package:nike_shop/init_db.dart';
import 'package:nike_shop/pages/main_wrapper/main_wrapper_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initDB();
  await initLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<EdtPassCubit>()),
        BlocProvider(create: (context) => locator.get<BottomNavbarCubit>()),
        BlocProvider(create: (context) => locator.get<TypeProductCubit>()),
        BlocProvider(create: (context) => locator.get<NavigatorCubit>()),
        BlocProvider(create: (context) => locator.get<FabProductCubit>()),
        BlocProvider(create: (context) => locator.get<FabShopCubit>()),
        BlocProvider(create: (context) => locator.get<FavoriteCubit>()),
        BlocProvider(create: (context) => locator.get<HomeBloc>()),
        BlocProvider(create: (context) => locator.get<ProductBloc>()),
        BlocProvider(create: (context) => locator.get<LoginAuthBloc>()),
        BlocProvider(create: (context) => locator.get<RegisterAuthBloc>()),
        BlocProvider(create: (context) => locator.get<CommentBloc>()),
        BlocProvider(create: (context) => locator.get<CartBloc>()),
        BlocProvider(create: (context) => locator.get<FavoriteProductBloc>()),
        BlocProvider(create: (context) => locator.get<PaymentBloc>()),
        BlocProvider(create: (context) => locator.get<OrderBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        supportedLocales: const [
          Locale('en'),
          Locale('fa'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: const Locale('fa'),
        home: const MainWrapperPage(),
      ),
    );
  }
}
