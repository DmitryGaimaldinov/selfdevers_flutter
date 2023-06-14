// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_followings_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFollowingsResultDto _$$_GetFollowingsResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_GetFollowingsResultDto(
      followings: (json['followings'] as List<dynamic>)
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetFollowingsResultDtoToJson(
        _$_GetFollowingsResultDto instance) =>
    <String, dynamic>{
      'followings': instance.followings,
    };
