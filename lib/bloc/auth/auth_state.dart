import 'package:equatable/equatable.dart';

abstract class LoginAuthState extends Equatable {}

class InitLoginState extends LoginAuthState {
  @override
  List<Object?> get props => [];
}

class LoadingLoginState extends LoginAuthState {
  @override
  List<Object?> get props => [];
}

class CompletedLoginState extends LoginAuthState {
  @override
  List<Object?> get props => [];
}

class FailedLoginState extends LoginAuthState {
  final String errorMessage;
  FailedLoginState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

abstract class RegisterAuthState extends Equatable {}

class InitRegisterState extends RegisterAuthState {
  @override
  List<Object?> get props => [];
}

class LoadingRegisterState extends RegisterAuthState {
  @override
  List<Object?> get props => [];
}

class CompletedRegisterState extends RegisterAuthState {
  @override
  List<Object?> get props => [];
}

class FailedRegisterState extends RegisterAuthState {
  final String errorMessage;
  FailedRegisterState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
