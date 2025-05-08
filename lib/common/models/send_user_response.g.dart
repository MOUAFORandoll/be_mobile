// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendUserResponseImpl _$$SendUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SendUserResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      content: json['content'],
    );

Map<String, dynamic> _$$SendUserResponseImplToJson(
        _$SendUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'content': instance.content,
    };
