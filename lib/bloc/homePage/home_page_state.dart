part of 'home_page_bloc.dart';

class HomePageState extends FDAState {
  final bool showLogin;
  final Map? registerBody;

  HomePageState({required this.showLogin, this.registerBody});

  HomePageState copyWith({bool? showLogin}) {
    return HomePageState(showLogin: showLogin ?? this.showLogin);
  }

  HomePageState swapLoginRegister() {
    return HomePageState(showLogin: !showLogin);
  }

  HomePageState swapViewPassword() {
    return HomePageState(showLogin: showLogin);
  }

  @override
  String toString() {
    return "showLogin: $showLogin";
  }

  List<Object> get props => [
        showLogin,
      ];
}
