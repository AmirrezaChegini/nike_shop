abstract class AuthEvent {}

class RegisterAuthEvent extends AuthEvent {
  String email;
  String password;

  RegisterAuthEvent(this.email, this.password);
}

class LoginAuthEvent extends AuthEvent {
  String username;
  String password;

  LoginAuthEvent(this.username, this.password);
}
