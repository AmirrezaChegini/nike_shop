import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class SearchEdtText extends StatelessWidget {
  const SearchEdtText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        cursorColor: MyColor.grey,
        style: const TextStyle(
          fontFamily: 'iranyekan',
          color: MyColor.black,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.search, color: MyColor.black),
          hintText: 'جستجو',
          focusColor: MyColor.grey,
          prefixIconColor: MyColor.grey,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: MyColor.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: MyColor.grey),
          ),
          hintStyle: const TextStyle(
            fontFamily: 'iranyekan',
            color: MyColor.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
