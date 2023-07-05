import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_event.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/auth_cubit.dart';
import 'package:nike_shop/pages/auth/widgets/text_btn.dart';
import 'package:nike_shop/utils/shared_pref.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'آیا می خواهید از حساب خود خارج شوید؟',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextBtn(
                backgroundColor: MyColor.white,
                foregroundColor: MyColor.blue,
                child: const Text('بله'),
                ontap: () {
                  Navigator.pop(context);
                  SharedPref.clearAll();
                  BlocProvider.of<AuthCubit>(context).isLoggedIn(false);
                  BlocProvider.of<CartBloc>(context).add(GetAllCartEvent());
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextBtn(
                backgroundColor: MyColor.blue,
                foregroundColor: MyColor.white,
                child: const Text('خیر'),
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
