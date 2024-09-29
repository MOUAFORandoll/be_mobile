part of 'user_cubit.dart';

mixin UserState on Equatable {}

class InitializingUserState extends CubitSuccessState with UserState {
  const InitializingUserState() : super();
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class UserNotLoggedState extends CubitSuccessState with UserState {
  const UserNotLoggedState() : super();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class UserLoggedState extends CubitSuccessState with UserState {
  final User user;

  const UserLoggedState(this.user) : super();

  @override
  List<Object?> get props => [user];
}

class UserLoadingState extends CubitLoadingState with UserState {
  const UserLoadingState() : super();
}

class UserLoggingOut extends CubitLoadingState with UserState {
  const UserLoggingOut() : super();
}

class CompleteUserProfileState extends CubitInformationState with UserState {
  const CompleteUserProfileState();
}

class UserDeleting extends CubitLoadingState with UserState {
  const UserDeleting() : super();
}

class UserUpdatingState extends CubitLoadingState with UserState {
  const UserUpdatingState() : super();
}

class UserUpdatedState extends CubitInformationState with UserState {
  const UserUpdatedState() : super();
}

class UserErrorState extends CubitErrorState with UserState {
  UserErrorState(super.error, [super.trace]);
}

class AuthLoadingState extends CubitLoadingState with UserState {
  const AuthLoadingState();
}

class AuthUserExistState extends CubitInformationState with UserState {
  const AuthUserExistState();
}

class AuthUserNotExistState extends CubitInformationState with UserState {
  const AuthUserNotExistState();
}

class AuthUserSuccessState extends CubitInformationState with UserState {
  const AuthUserSuccessState();
}
 
class AuthMissingSupplierInformation extends CubitInformationState
    with UserState {
  const AuthMissingSupplierInformation();
}

class AuthErrorState extends CubitErrorState with UserState {
  AuthErrorState(super.error, [super.trace]);
}

class SendedState extends CubitInformationState with UserState {
  const SendedState();
}

class ValidCodeState extends CubitInformationState with UserState {
  const ValidCodeState();
}

class SuccesChangePasswordState extends CubitInformationState with UserState {
  const SuccesChangePasswordState();
}
