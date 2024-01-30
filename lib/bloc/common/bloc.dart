abstract class FDAEvent {}

abstract class FDAState {}

class StateInitialized extends FDAState {}

class StateLoading extends FDAState {
  @override
  String toString() => 'Loading...';
}

class StateError extends FDAState {
  final String message;
  StateError({required this.message});

  @override
  String toString() => message;
}
