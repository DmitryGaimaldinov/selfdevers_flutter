// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_followers_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFollowersResultDto _$$_GetFollowersResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_GetFollowersResultDto(
      followers: (json['followers'] as List<dynamic>)
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetFollowersResultDtoToJson(
        _$_GetFollowersResultDto instance) =>
    <String, dynamic>{
      'followers': instance.followers,
    };
