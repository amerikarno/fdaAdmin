import 'package:bloc/bloc.dart';
import 'package:fda_admin_app/bloc/common/bloc.dart';

// import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState(showLogin: true)) {
    on<HomePageEventSwapLoginRegister>((event, emit) {
      emit(state.swapLoginRegister());
    });
  }
}
