import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_user_response.freezed.dart';
part 'verify_user_response.g.dart';

@freezed
class VerifyUserResponse with _$VerifyUserResponse {
  const factory VerifyUserResponse({
    required bool success,
    required String message,
    required dynamic content,
  }) = _VerifyUserResponse;

  factory VerifyUserResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserResponseFromJson(json);
}
