import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
    required this.title,
    required this.ontap,
  });

  final String title;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: FloatingActionButton.extended(
        onPressed: ontap,
        label: Text(title),
      ),
    );
  }
}
