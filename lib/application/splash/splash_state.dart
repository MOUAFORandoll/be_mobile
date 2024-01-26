part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.loading() = Loading;
  const factory SplashState.loaded(bool isLogin, PageRouteInfo<dynamic> route) =
      Loaded;
}
