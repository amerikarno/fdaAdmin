import 'package:finansiada/bloc/register/register_bloc.dart';
import 'package:finansiada/pages/home/widget/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormRegister extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameENController = TextEditingController();
  final TextEditingController lastNameENController = TextEditingController();
  final TextEditingController firstNameTHController = TextEditingController();
  final TextEditingController lastNameTHController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController vilageNumberController = TextEditingController();
  final TextEditingController vilageNameController = TextEditingController();
  final TextEditingController subStreetController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController subDistrictController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  FormRegister({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormInput(inputController: firstNameENController, text: "Firstname(EN)"),
            const SizedBox(height: 20),
            FormInput(inputController: lastNameENController, text: "Surname(EN)"),
            const SizedBox(height: 20),
            FormInput(inputController: firstNameTHController, text: "Firstname(TH)"),
            const SizedBox(height: 20),
            FormInput(inputController: lastNameTHController, text: "Surname(TH)"),
            const SizedBox(height: 20),
            FormInput(inputController: addressController, text: "Address Number"),
            const SizedBox(height: 20),
            FormInput(inputController: vilageNumberController, text: "Vilage Number"),
            const SizedBox(height: 20),
            FormInput(inputController: vilageNameController, text: "Vilage Name"),
            const SizedBox(height: 20),
            FormInput(inputController: subStreetController, text: "Sub Street"),
            const SizedBox(height: 20),
            FormInput(inputController: streetController, text: "Street"),
            const SizedBox(height: 20),
            FormInput(inputController: subDistrictController, text: "Sub District"),
            const SizedBox(height: 20),
            FormInput(inputController: districtController, text: "Disctrict"),
            const SizedBox(height: 20),
            FormInput(inputController: provinceController, text: "Province"),
            const SizedBox(height: 20),
            FormInput(inputController: countryController, text: "Country"),
            const SizedBox(height: 20),
            FormInput(inputController: zipcodeController, text: "Zipcode"),
            const SizedBox(height: 20),
            Row(
              children: [
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return !state.acceptAgreement
                        ? GestureDetector(
                            onTap: () {
                              context.read<RegisterBloc>().add(const AgreementChange(true));
                            },
                            child: const Icon(Icons.check_box_outline_blank),
                          )
                        : GestureDetector(
                            onTap: () {
                              context.read<RegisterBloc>().add(const AgreementChange(false));
                            },
                            child: const Icon(Icons.check_box_outlined),
                          );
                  },
                ),
                const SizedBox(width: 10),
                const Text("Accept all term and agreement"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
