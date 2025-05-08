// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exist_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExistUserResponseImpl _$$ExistUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ExistUserResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      content: json['content'] == null
          ? null
          : ExistUserContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExistUserResponseImplToJson(
        _$ExistUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'content': instance.content,
    };

_$ExistUserContentImpl _$$ExistUserContentImplFromJson(
        Map<String, dynamic> json) =>
    _$ExistUserContentImpl(
      existStatus: json['exist_status'] as bool,
    );

Map<String, dynamic> _$$ExistUserContentImplToJson(
        _$ExistUserContentImpl instance) =>
    <String, dynamic>{
      'exist_status': instance.existStatus,
    };
