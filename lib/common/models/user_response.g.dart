// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      content: json['content'] == null
          ? null
          : AuthContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'content': instance.content,
    };

_$AuthContentImpl _$$AuthContentImplFromJson(Map<String, dynamic> json) =>
    _$AuthContentImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthContentImplToJson(_$AuthContentImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
