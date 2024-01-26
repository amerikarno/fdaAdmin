import 'package:finansiada/pages/home/homePage.dart';
import 'package:finansiada/pages/login/loginSuccess.dart';
import 'package:finansiada/pages/register/registerBody.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const home = "home";
  static const login = "login";
  static const register = "register";

  final _route = <String, WidgetBuilder>{
    home: (context) => const MyHomePage(title: "HomePage"),
    login: (context) => const LoginSuccess(),
    register: (context) => const RegisterBody(),
  };

  get getAll => _route;
}
