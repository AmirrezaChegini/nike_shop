import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/utils/shared_pref.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(SharedPref.isLoggedIn());

  void isLoggedIn(bool isLogIn) {
    emit(isLogIn);
  }
}
