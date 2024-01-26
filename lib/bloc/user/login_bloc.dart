import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(email: '', password: '', obsecure: false)) {
    on<LoginEvent>((event, emit) {});

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginShowPassword>((event, emit) {
      emit(state.copyWith(obsecure: event.obsecure));
    });
  }
}
