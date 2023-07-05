import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/auth_cubit.dart';
import 'package:nike_shop/utils/shared_pref.dart';
import 'package:nike_shop/widgets/my_alert_dialog.dart';
import 'package:nike_shop/widgets/my_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'پروفایل',
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.logout,
              color: MyColor.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const MyAlertDialog(),
              );
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'assets/images/nike_logo.png',
              fit: BoxFit.cover,
              width: 50,
            ),
            const SizedBox(height: 30),
            BlocBuilder<AuthCubit, bool>(
              builder: (context, state) {
                if (state == true) {
                  return Text(SharedPref.getString(key: 'username'));
                } else {
                  return const Text('Nothing');
                }
              },
            ),
            const Divider(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
              label: const Text('لیست علاقه مندی ها'),
              style: TextButton.styleFrom(
                foregroundColor: MyColor.black,
                alignment: Alignment.centerRight,
                minimumSize: const Size.fromHeight(40),
                padding: const EdgeInsets.all(0),
              ),
            ),
            const Divider(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.archive_outlined),
              label: const Text('سوابق سفارش'),
              style: TextButton.styleFrom(
                foregroundColor: MyColor.black,
                alignment: Alignment.centerRight,
                minimumSize: const Size.fromHeight(40),
                padding: const EdgeInsets.all(0),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
