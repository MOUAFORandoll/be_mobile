part of 'app_action_cubit.dart';

@freezed
class AppActionState with _$AppActionState {
  const factory AppActionState(
      {required bool isLogin,
      required int index,
    /*   required Locale? locale */}) = _AppActionState;
  factory AppActionState.initial() => AppActionState(isLogin: true, index: 0);
}
