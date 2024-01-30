import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:fda_admin_app/bloc/user/login/event.dart';
import 'package:fda_admin_app/bloc/user/login/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  String generateHash(String input) {
    // Convert input String to bytes
    var bytes = utf8.encode(input);

    // Generate SHA-256 hash
    var digest = sha256.convert(bytes);

    // Return the hash in hexadecimal string format
    return digest.toString();
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final dio = Dio();
      final response = await dio.post(
        'http://localhost:1323/admin/v1/login',
        data: {
          'hashedUsername': generateHash(event.username),
          'hashedPassword': generateHash(event.password)
        },
      );

      // Assuming successful login if status code is 200
      if (response.statusCode == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Invalid credentials'));
      }
    } on DioException catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
