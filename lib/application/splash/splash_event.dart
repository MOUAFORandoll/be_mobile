part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.startLoading(
      String currentLangue, BuildContext context) = StartLoading;
}
