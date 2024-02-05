part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required User? user,
    required int index,
    required int indexHistory,
    required bool? recupMailStatus,
    required bool? noOpen,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
      user: null,
      index: 0,
      indexHistory: 0,
      recupMailStatus: true,
      noOpen: false);
}
