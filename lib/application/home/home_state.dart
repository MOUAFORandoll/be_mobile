part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required User? user,
    required int index,
  }) = _HomeState;
  
  factory HomeState.initial() => HomeState(user: null, index: 0);
}
