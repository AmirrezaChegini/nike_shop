import 'package:flutter_bloc/flutter_bloc.dart';

class FabProductCubit extends Cubit<bool> {
  FabProductCubit() : super(false);

  void hideFab(bool isHide) {
    emit(isHide);
  }
}

class FabShopCubit extends Cubit<bool> {
  FabShopCubit() : super(false);

  void hideFab(bool isHide) {
    emit(isHide);
  }
}
