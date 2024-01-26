
part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.chooseExperience({
    required String phone,
    required String password,
  }) = SignInEvent;

  const factory UserEvent.register({
    required String name,
    required String phone,
    required String password,
    required String re_password,
  }) = RegisterEvent;

  // Uncomment and customize these events as needed
  // const factory UserEvent.signOut() = SignOutEvent;
  // const factory UserEvent.getDataBase() = GetDataBateEvent;
  // const factory UserEvent.checkUserIsConnected() = CheckUserIsConnectedEvent;
  // const factory UserEvent.getUserDB() = GetUserDBEvent;
}
