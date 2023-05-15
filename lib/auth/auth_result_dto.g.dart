// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResultDto _$AuthResultDtoFromJson(Map<String, dynamic> json) =>
    AuthResultDto(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthResultDtoToJson(AuthResultDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
