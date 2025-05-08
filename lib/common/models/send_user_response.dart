import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_user_response.freezed.dart';
part 'send_user_response.g.dart';

@freezed
class SendUserResponse with _$SendUserResponse {
  const factory SendUserResponse({
    required bool success,
    required String message,
    required dynamic content,
  }) = _SendUserResponse;

  factory SendUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SendUserResponseFromJson(json);
}
