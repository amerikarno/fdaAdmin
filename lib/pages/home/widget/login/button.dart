import 'package:fda_admin_app/app_routes.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.pushNamed(context, AppRoute.login);
        } else {
          var snackBar = const SnackBar(
            content: Text('Some fields was incorrect. Try to fix first.'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const Text("Login"),
    );
  }
}
