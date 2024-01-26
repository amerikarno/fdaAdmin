part of 'login_bloc.dart';

class LoginState extends FDAState {
  final String email;
  final String password;
  final bool obsecure;

  LoginState(
      {required this.email, required this.password, required this.obsecure});

  LoginState copyWith({String? email, String? password, bool? obsecure}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obsecure: obsecure ?? this.obsecure,
    );
  }

  List<Object> get props => [email, password, obsecure];
}
