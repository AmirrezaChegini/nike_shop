import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/utils/shared_pref.dart';

class NavigatorCubit extends Cubit<int> {
  NavigatorCubit() : super(SharedPref.isLoggedIn() ? 1 : 0);

  void navigate(int index) {
    emit(index);
  }
}
