import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(
          const RegisterState(
            firstNameEN: '',
            lastNameEN: '',
            firstNameTH: '',
            lastNameTH: '',
            addressNumber: '',
            vilageNumber: '',
            vilageName: '',
            subStreet: '',
            street: '',
            subDistrict: '',
            district: '',
            province: '',
            country: '',
            zipcode: '',
            acceptAgreement: false,
          ),
        ) {
    on<RegisterEvent>((event, emit) {});

    on<FirstNameENChange>((event, emit) {
      emit(state.copyWith(firstNameEN: event.firstName));
    });

    on<LastNameENChanged>((event, emit) {
      emit(state.copyWith(lastNameEN: event.lastName));
    });

    on<FirstNameTHChange>((event, emit) {
      emit(state.copyWith(firstNameTH: event.firstName));
    });

    on<LastNameTHChanged>((event, emit) {
      emit(state.copyWith(lastNameTH: event.lastName));
    });

    on<AddressChange>((event, emit) {
      emit(state.copyWith(addressNumber: event.address));
    });

    on<VilageNumberChnage>((event, emit) {
      emit(state.copyWith(vilageNumber: event.vilageNumber));
    });

    on<VilageNameChange>((event, emit) {
      emit(state.copyWith(vilageName: event.vilageName));
    });

    on<SubStreetChange>((event, emit) {
      emit(state.copyWith(subStreet: event.subStreet));
    });

    on<StreetChnage>((event, emit) {
      emit(state.copyWith(street: event.street));
    });

    on<SubDistrictChange>((event, emit) {
      emit(state.copyWith(subDistrict: event.subDistrict));
    });

    on<DistrictChnage>((event, emit) {
      emit(state.copyWith(district: event.district));
    });

    on<ProvinceChange>((event, emit) {
      emit(state.copyWith(province: event.province));
    });

    on<CountryChange>((event, emit) {
      emit(state.copyWith(country: event.country));
    });

    on<ZipcodeChange>((event, emit) {
      emit(state.copyWith(zipcode: event.zipcode));
    });

    on<AgreementChange>((event, emit) {
      emit(state.copyWith(acceptAgreement: event.acceptAgreement));
    });
  }
}
