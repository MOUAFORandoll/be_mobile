import 'package:freezed_annotation/freezed_annotation.dart';

part 'exist_user_response.freezed.dart';
part 'exist_user_response.g.dart';

@freezed
class ExistUserResponse with _$ExistUserResponse {
  const factory ExistUserResponse({
    required bool success,
    required String message,
    required ExistUserContent ?content,
  }) = _ExistUserResponse;

  factory ExistUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ExistUserResponseFromJson(json);
}

@freezed
class ExistUserContent with _$ExistUserContent {
  const factory ExistUserContent({
    @JsonKey(name: 'exist_status') required bool existStatus,
  }) = _ExistUserContent;

  factory ExistUserContent.fromJson(Map<String, dynamic> json) =>
      _$ExistUserContentFromJson(json);
}
