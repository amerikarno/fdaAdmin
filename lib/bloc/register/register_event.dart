part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class FirstNameENChange extends RegisterEvent {
  final String firstName;

  const FirstNameENChange(this.firstName);

  @override
  List<Object> get props => [firstName];
}

class LastNameENChanged extends RegisterEvent {
  final String lastName;

  const LastNameENChanged(this.lastName);

  @override
  List<Object> get props => [lastName];
}

class FirstNameTHChange extends RegisterEvent {
  final String firstName;

  const FirstNameTHChange(this.firstName);

  @override
  List<Object> get props => [firstName];
}

class LastNameTHChanged extends RegisterEvent {
  final String lastName;

  const LastNameTHChanged(this.lastName);

  @override
  List<Object> get props => [lastName];
}

class AddressChange extends RegisterEvent {
  final String address;

  const AddressChange(this.address);

  @override
  List<Object> get props => [address];
}

class VilageNumberChnage extends RegisterEvent {
  final String vilageNumber;

  const VilageNumberChnage(this.vilageNumber);

  @override
  List<Object> get props => [vilageNumber];
}

class VilageNameChange extends RegisterEvent {
  final String vilageName;

  const VilageNameChange(this.vilageName);

  @override
  List<Object> get props => [vilageName];
}

class SubStreetChange extends RegisterEvent {
  final String subStreet;

  const SubStreetChange(this.subStreet);

  @override
  List<Object> get props => [subStreet];
}

class StreetChnage extends RegisterEvent {
  final String street;

  const StreetChnage(this.street);

  @override
  List<Object> get props => [street];
}

class SubDistrictChange extends RegisterEvent {
  final String subDistrict;

  const SubDistrictChange(this.subDistrict);

  @override
  List<Object> get props => [subDistrict];
}

class DistrictChnage extends RegisterEvent {
  final String district;

  const DistrictChnage(this.district);

  @override
  List<Object> get props => [district];
}

class ProvinceChange extends RegisterEvent {
  final String province;

  const ProvinceChange(this.province);

  @override
  List<Object> get props => [province];
}

class CountryChange extends RegisterEvent {
  final String country;

  const CountryChange(this.country);

  @override
  List<Object> get props => [country];
}

class ZipcodeChange extends RegisterEvent {
  final String zipcode;

  const ZipcodeChange(this.zipcode);

  @override
  List<Object> get props => [zipcode];
}

class AgreementChange extends RegisterEvent {
  final bool acceptAgreement;

  const AgreementChange(this.acceptAgreement);

  @override
  List<Object> get props => [acceptAgreement];
}
