import 'package:finansiada/pages/home/widget/inputField.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  FormLogin({Key? key, required this.formKey}) : super(key: key);

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
