part of 'login_bloc.dart';

abstract class LoginEvent extends FDAEvent {
  LoginEvent();
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);

  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);

  List<Object> get props => [password];
}

class LoginShowPassword extends LoginEvent {
  final bool obsecure;

  LoginShowPassword({required this.obsecure});
  List<Object> get props => [obsecure];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});

  List<Object> get props => [
        email,
        password,
      ];
}
