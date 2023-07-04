import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/pages/auth/widgets/text_btn.dart';
import 'package:nike_shop/pages/shopping/widgets/shopping_detail.dart';
import 'package:nike_shop/widgets/edt_text.dart';
import 'package:nike_shop/widgets/my_appbar.dart';

class AddressPage extends StatelessWidget {
  AddressPage({
    super.key,
    required this.cartList,
  });
  final List<Cart> cartList;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      resizeToAvoidBottomInset: false,
      appBar: const MyAppbar(
        title: 'انتخاب آدرس و شیوه پرداخت',
        leading: BackButton(
          color: MyColor.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  EdtText(
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    label: 'نام و نام خانوادگی',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'نام خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  EdtText(
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    label: 'کد پستی',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'کدپستی خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  EdtText(
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    label: 'شماره تلفن',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'شماره تلفن خود را وارد کنید';
                      }
                      if (value.length != 11) {
                        return 'شماره تلفن اشتباه است';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  EdtText(
                    textInputType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                    label: 'آدرس تحویل گیرنده',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'آدرس خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ShoppingDetail(cartList: cartList),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: TextBtn(
                    backgroundColor: MyColor.white,
                    foregroundColor: MyColor.blue,
                    radius: 5,
                    child: const Text('پرداخت در محل'),
                    ontap: () {
                      if (_globalKey.currentState!.validate()) {
                        print('ok');
                      }
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextBtn(
                    backgroundColor: MyColor.blue,
                    foregroundColor: MyColor.white,
                    radius: 5,
                    child: const Text('پرداخت اینترنتی'),
                    ontap: () {},
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
