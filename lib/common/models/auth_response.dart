import 'package:BabanaExpress/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required bool success,
    required String message,
    required AuthContent? content,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class AuthContent with _$AuthContent {
  const factory AuthContent({
    required String token,
    required String refreshToken,
    required User user,
  }) = _AuthContent;

  factory AuthContent.fromJson(Map<String, dynamic> json) =>
      _$AuthContentFromJson(json);
}
