import 'package:BabanaExpress/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required bool success,
    required String message,
    required AuthContent? content,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class AuthContent with _$AuthContent {
  const factory AuthContent({
  
    required User user,
  }) = _AuthContent;

  factory AuthContent.fromJson(Map<String, dynamic> json) =>
      _$AuthContentFromJson(json);
}
