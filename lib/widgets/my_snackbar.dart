import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

showMessage(BuildContext context, String message,
    {SnackBarAction? snackBarAction}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'iranyekan',
          color: MyColor.white,
        ),
      ),
      action: snackBarAction,
      backgroundColor: MyColor.black,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
