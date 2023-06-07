// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResultDto _$$_AuthResultDtoFromJson(Map<String, dynamic> json) =>
    _$_AuthResultDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_AuthResultDtoToJson(_$_AuthResultDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
