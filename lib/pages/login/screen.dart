import 'package:fda_admin_app/bloc/user/login/bloc.dart';
import 'package:fda_admin_app/bloc/user/login/event.dart';
import 'package:fda_admin_app/bloc/user/login/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigate to another page or show success dialog
        } else if (state is LoginFailure) {
          // Show error message
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'FDA Admin Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                formField(usernameController, 'Username'),
                const SizedBox(
                  height: 10,
                ),
                formField(passwordController, 'Password'),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          LoginSubmitted(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField formField(
          TextEditingController usernameController, String? hint) =>
      TextFormField(
          obscureText: (hint == 'Password') ? true : false,
          controller: usernameController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              filled: true,
              fillColor: Colors.white));
}
