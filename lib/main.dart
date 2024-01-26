import 'package:fda_admin_app/app_routes.dart';
import 'package:fda_admin_app/bloc/app_bloc_observer.dart';
import 'package:fda_admin_app/bloc/homePage/home_page_bloc.dart';
import 'package:fda_admin_app/bloc/register/register_bloc.dart';
import 'package:fda_admin_app/bloc/user/login_bloc.dart';
import 'package:fda_admin_app/pages/home/home_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute().getAll,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'HomePage'),
      ),
    );
  }
}
