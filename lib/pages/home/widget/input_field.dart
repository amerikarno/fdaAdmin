import 'package:fda_admin_app/bloc/register/register_bloc.dart';
import 'package:fda_admin_app/bloc/user/login_bloc.dart';
import 'package:fda_admin_app/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormInput extends StatefulWidget {
  final String text;

  final TextEditingController inputController;
  const FormInput({super.key, required this.inputController, required this.text});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool obsecure = false;

  @override
  void initState() {
    if (widget.text == "Password") {
      setState(() {
        obsecure = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ],
          ),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextFormField(
                validator: (value) {
                  return validateFields(widget.text, value);
                },
                controller: widget.inputController,
                obscureText: obsecure,
                keyboardType:
                    (widget.text == "Password" || widget.text == "Zipcode")
                        ? TextInputType.number
                        : TextInputType.emailAddress,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                onChanged: (value) {
                  keptTextState(context, widget.text, value);
                },
                decoration: InputDecoration(
                  suffixIcon: widget.text == "Password"
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          child: obsecure
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        )
                      : null,
                  label: widget.text == "Password"
                      ? Text("${widget.text} 6 digit")
                      : Text(widget.text),
                  labelStyle: const TextStyle(color: primaryColor),
                  filled: true,
                  fillColor: accentColor,
                  hintText: widget.text,
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  border: outlineInputBorder(primaryColor),
                  focusedBorder: outlineInputBorder(secondaryColor),
                  errorBorder: outlineInputBorder(errorColor),
                  enabledBorder: outlineInputBorder(primaryColor),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder(Color primaryColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }

  String? validateFields(String type, String? value) {
    RegEx regEx = RegEx();
    if (value == null) {
      return "$type is empty";
    } else if (type == "Firstname(TH)" || type == "Surname(TH)") {
      if (!regEx.isValidThaiText(value)) {
        return "Incorrect format";
      }
    } else if (type == "Firstname(EN)" || type == "Surname(EN)") {
      if (!regEx.isValidEnglishText(value)) {
        return "Incorrect format";
      }
    } else if (type == "Email") {
      if (!regEx.isValidEmail(value)) {
        return "Incorrect format";
      }
    } else if (type == "Password") {
      if (value.length < 6) {
        return "At least 6 digits";
      }
    } else if (value.isEmpty) {
      return "$type is empty";
    }
    return null;
  }

  keptTextState(BuildContext context, String type, String value) {
    switch (type) {
      case "Email":
        context.read<LoginBloc>().add(EmailChanged(value));
        break;
      case "Password":
        context.read<LoginBloc>().add(PasswordChanged(value));
        break;
      case "Firstname(EN)":
        context.read<RegisterBloc>().add(FirstNameENChange(value));
        break;
      case "Surname(EN)":
        context.read<RegisterBloc>().add(LastNameENChanged(value));
        break;
      case "Firstname(TH)":
        context.read<RegisterBloc>().add(FirstNameTHChange(value));
        break;
      case "Surname(TH)":
        context.read<RegisterBloc>().add(LastNameTHChanged(value));
        break;
      case "Address Number":
        context.read<RegisterBloc>().add(AddressChange(value));
        break;
      case "Vilage Number":
        context.read<RegisterBloc>().add(VilageNumberChnage(value));
        break;
      case "Vilage Name":
        context.read<RegisterBloc>().add(VilageNameChange(value));
        break;
      case "Sub Street":
        context.read<RegisterBloc>().add(SubStreetChange(value));
        break;
      case "Street":
        context.read<RegisterBloc>().add(StreetChnage(value));
        break;
      case "Sub District":
        context.read<RegisterBloc>().add(SubDistrictChange(value));
        break;
      case "Disctrict":
        context.read<RegisterBloc>().add(DistrictChnage(value));
        break;
      case "Province":
        context.read<RegisterBloc>().add(ProvinceChange(value));
        break;
      case "Country":
        context.read<RegisterBloc>().add(CountryChange(value));
        break;
      case "Zipcode":
        context.read<RegisterBloc>().add(ZipcodeChange(value));
        break;
      default:
    }
  }
}
