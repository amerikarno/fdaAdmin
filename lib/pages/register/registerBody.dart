import 'package:finansiada/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                displayInfo("User register infomation", ""),
                displayInfo(state.firstNameEN, "firstNameEN :"),
                displayInfo(state.lastNameEN, "lastNameEN"),
                displayInfo(state.firstNameTH, "firstNameTH"),
                displayInfo(state.lastNameTH, "lastNameTH"),
                displayInfo(state.addressNumber, "addressNumber"),
                displayInfo(state.vilageName, "vilageName"),
                displayInfo(state.vilageName, "vilageName"),
                displayInfo(state.subStreet, "subStreet"),
                displayInfo(state.street, "street"),
                displayInfo(state.subDistrict, "subDistrict"),
                displayInfo(state.district, "district"),
                displayInfo(state.province, "province"),
                displayInfo(state.country, "country"),
                displayInfo(state.zipcode, "zipcode"),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget displayInfo(String data, String fieldName) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text(fieldName),
            const SizedBox(width: 10),
            Text(data),
          ],
        ),
      ),
    );
  }
}
