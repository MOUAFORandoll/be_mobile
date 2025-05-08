// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyUserResponseImpl _$$VerifyUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyUserResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      content: json['content'],
    );

Map<String, dynamic> _$$VerifyUserResponseImplToJson(
        _$VerifyUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'content': instance.content,
    };
