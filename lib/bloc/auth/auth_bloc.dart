import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/auth/auth_event.dart';
import 'package:nike_shop/bloc/auth/auth_state.dart';
import 'package:nike_shop/data/repositories/auth_repository.dart';

class LoginAuthBloc extends Bloc<AuthEvent, LoginAuthState> {
  final IAuthRepository _repository;

  LoginAuthBloc(this._repository) : super(InitLoginState()) {
    on<LoginAuthEvent>((event, emit) async {
      emit(LoadingLoginState());
      await Future.delayed(const Duration(seconds: 1));
      var either = await _repository.login(event.username, event.password);

      either.fold((l) {
        emit(FailedLoginState(l));
      }, (r) {
        emit(CompletedLoginState());
      });
    });
  }
}

class RegisterAuthBloc extends Bloc<AuthEvent, RegisterAuthState> {
  final IAuthRepository _repository;

  RegisterAuthBloc(this._repository) : super(InitRegisterState()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(LoadingRegisterState());
      await Future.delayed(const Duration(seconds: 1));
      var either = await _repository.register(event.email, event.password);

      either.fold((l) {
        emit(FailedRegisterState(l));
      }, (r) {
        emit(CompletedRegisterState());
      });
    });
  }
}
