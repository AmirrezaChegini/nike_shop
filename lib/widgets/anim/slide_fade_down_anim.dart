import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/cubit/fab_cubit.dart';

class SlideFadeDownAnim extends StatelessWidget {
  const SlideFadeDownAnim({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FabProductCubit, bool>(
      builder: (context, state) => AnimatedOpacity(
        opacity: state ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          offset: state ? const Offset(0, 1) : Offset.zero,
          child: widget,
        ),
      ),
    );
  }
}
