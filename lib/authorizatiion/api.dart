import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:fda_admin_app/authorizatiion/models.dart';
import 'package:fda_admin_app/authorizatiion/sessions.dart';

class Api {
  late Dio dio;
  var session = Session();
  var baseOptions = BaseOptions(
    // baseUrl: 'http://10.0.2.2:8000',
    baseUrl: 'http://127.0.0.1:1323',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  );
  bool get isLogin => session.isLogin;
  set isLogin(bool b) => session.isLogin = b;

  // singleton pattern
  static final Api _api = Api._constructor();
  factory Api() {
    return _api;
  }

  Api._constructor() {
    dio = Dio(baseOptions);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: tokenInterceptor,
    ));
  }

  Future<bool> login(String username, String password) async {
    try {
      var response = await dio.post(
        '/admin/v1/login',
        data: {
          'hashedUsername': generateHash(username),
          'hashedPassword': generateHash(password),
        },
      );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      session.refreshTokenRotate(Tokens.fromJson(response.data));
      return true;
    } catch (e) {
      return false;
    }
  }
    String generateHash(String input) {
    // Convert input String to bytes
    var bytes = utf8.encode(input);

    // Generate SHA-256 hash
    var digest = sha256.convert(bytes);

    // Return the hash in hexadecimal string format
    return digest.toString();
  }

  tokenInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // not login
    if (!isLogin) {
      handler.next(options);
      return;
    }

    // session timeout
    if (session.rtExp()) {
      handler.reject(DioException(requestOptions: options));
      isLogin = false;
      return;
    }

    // access timeout
    if (session.atExp()) {
      //special dio instance for refresh new token
      var response = await Dio(baseOptions).get(
        '/admin/v1/refresh',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${session.tokens.refreshToken}',
          },
        ),
      );
      if (response.statusCode != HttpStatus.ok) {
        handler.reject(DioException(requestOptions: options));
        return;
      }
      session.refreshTokenRotate(Tokens.fromJson(response.data));
    }

    //normal case
    options.headers.addAll({
      'Authorization': 'Bearer ${session.tokens.accessToken}',
    });

    handler.next(options);
  }

  Future<bool> logout() async {
    var refreshToken = session.tokens.refreshToken;
    session.clearSession();

    try {
      var response = await dio.get(
        '/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<Map<String, dynamic>> get(String path) async {
    Response response;
    try {
      response = await dio.get(path);
      if (response.statusCode != HttpStatus.ok) {
        return response.data;
      }
    } catch (e) {
      return {"error": e.toString()};
    }
    return response.data;
  }
}
