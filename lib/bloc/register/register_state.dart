part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String firstNameEN;
  final String lastNameEN;
  final String firstNameTH;
  final String lastNameTH;
  final String addressNumber;
  final String vilageNumber;
  final String vilageName;
  final String subStreet;
  final String street;
  final String subDistrict;
  final String district;
  final String province;
  final String country;
  final String zipcode;
  final bool acceptAgreement;

  const RegisterState({
    required this.firstNameEN,
    required this.lastNameEN,
    required this.firstNameTH,
    required this.lastNameTH,
    required this.addressNumber,
    required this.vilageNumber,
    required this.vilageName,
    required this.subStreet,
    required this.street,
    required this.subDistrict,
    required this.district,
    required this.province,
    required this.country,
    required this.zipcode,
    required this.acceptAgreement,
  });

  RegisterState copyWith({
    String? firstNameEN,
    String? lastNameEN,
    String? firstNameTH,
    String? lastNameTH,
    String? addressNumber,
    String? vilageNumber,
    String? vilageName,
    String? subStreet,
    String? street,
    String? subDistrict,
    String? district,
    String? province,
    String? country,
    String? zipcode,
    bool? acceptAgreement,
  }) {
    return RegisterState(
      firstNameEN: firstNameEN ?? this.firstNameEN,
      lastNameEN: lastNameEN ?? this.lastNameEN,
      firstNameTH: firstNameTH ?? this.firstNameTH,
      lastNameTH: lastNameTH ?? this.lastNameTH,
      addressNumber: addressNumber ?? this.addressNumber,
      vilageNumber: vilageNumber ?? this.vilageNumber,
      vilageName: vilageName ?? this.vilageName,
      subStreet: subStreet ?? this.subStreet,
      street: street ?? this.street,
      subDistrict: subDistrict ?? this.subDistrict,
      district: district ?? this.district,
      province: province ?? this.province,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      acceptAgreement: acceptAgreement ?? this.acceptAgreement,
    );
  }

  @override
  List<Object> get props => [
        firstNameEN,
        lastNameEN,
        firstNameTH,
        lastNameTH,
        addressNumber,
        vilageNumber,
        vilageName,
        subStreet,
        street,
        subDistrict,
        district,
        province,
        country,
        zipcode,
        acceptAgreement,
      ];
}
