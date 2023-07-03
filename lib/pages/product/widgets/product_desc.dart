import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductDesc extends StatelessWidget {
  const ProductDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Expandable(
        collapsed: ExpandableButton(
          child: const Text(
            'این کتونی شدیدا برای دویدن و راه رفتن توصیه میشود و تقریبا هیچ فشاری مخربی به پا وارد نمیکند',
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
        expanded: ExpandableButton(
          child: const Text(
            'این کتونی شدیدا برای دویدن و راه رفتن توصیه میشود و تقریبا هیچ فشاری مخربی به پا وارد نمیکند',
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
