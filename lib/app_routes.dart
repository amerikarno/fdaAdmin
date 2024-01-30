import 'package:fda_admin_app/pages/dashboard/screen.dart';
import 'package:fda_admin_app/pages/home/home_page.dart';
import 'package:fda_admin_app/pages/login/screen.dart';
// import 'package:fda_admin_app/pages/register/register_body.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const home = "home";
  static const login = "login";
  static const register = "register";
  static const dashboard = "dashboard";

  final _route = <String, WidgetBuilder>{
    home: (context) => const MyHomePage(title: "HomePage"),
    login: (context) => const LoginPage(),
    dashboard: (context) => const DashboardScreen(),
    // register: (context) => const RegisterBody(),
  };

  get getAll => _route;
}
