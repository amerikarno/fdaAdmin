import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState(showLogin: true)) {
    on<HomePageEventSwapLoginRegister>((event, emit) {
      emit(state.swapLoginRegister());
    });
  }
}
