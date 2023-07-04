import 'package:flutter/material.dart';
import 'package:nike_shop/constants/my_color.dart';

class EdtText extends StatelessWidget {
  const EdtText({
    super.key,
    required this.textInputType,
    required this.textInputAction,
    required this.label,
    required this.validator,
    this.obsecure = false,
    this.suffixIcon,
  });

  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String label;
  final Function(String) validator;
  final bool obsecure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value!),
      obscureText: obsecure,
      cursorColor: MyColor.grey,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: const TextStyle(
        fontFamily: 'iranyekan',
        color: MyColor.grey,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'iranyekan',
          color: MyColor.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MyColor.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MyColor.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MyColor.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MyColor.red,
          ),
        ),
      ),
    );
  }
}
