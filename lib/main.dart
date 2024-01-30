import 'package:fda_admin_app/app_routes.dart';
import 'package:fda_admin_app/bloc/app/observer.dart';
import 'package:fda_admin_app/pages/login/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // BlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  //   blocObserver: AppBlocObserver(),
  // );
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Admin',
      routes: AppRoute().getAll,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'HomePage'),
      home: const LoginPage(),
    );
  }
}
