import 'package:fda_admin_app/pages/home/widget/input_field.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  FormLogin({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormInput(inputController: emailController, text: "Email"),
          const SizedBox(height: 20),
          FormInput(inputController: passController, text: "Password"),
        ],
      ),
    );
  }
}
