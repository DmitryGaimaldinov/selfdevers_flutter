// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      userTag: json['userTag'] as String,
      description: json['description'] as String,
      registerDate: DateTime.parse(json['registerDate'] as String),
      avatar: json['avatar'] == null
          ? null
          : ImageDto.fromJson(json['avatar'] as Map<String, dynamic>),
      background: json['background'] == null
          ? null
          : ImageDto.fromJson(json['background'] as Map<String, dynamic>),
      isPrivate: json['isPrivate'] as bool,
      counters:
          UserCountersDto.fromJson(json['counters'] as Map<String, dynamic>),
      isMe: json['isMe'] as bool,
      followState: $enumDecode(_$FollowStateDtoEnumMap, json['followState']),
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userTag': instance.userTag,
      'description': instance.description,
      'registerDate': instance.registerDate.toIso8601String(),
      'avatar': instance.avatar,
      'background': instance.background,
      'isPrivate': instance.isPrivate,
      'counters': instance.counters,
      'isMe': instance.isMe,
      'followState': _$FollowStateDtoEnumMap[instance.followState]!,
    };

const _$FollowStateDtoEnumMap = {
  FollowStateDto.notFollowing: 'notFollowing',
  FollowStateDto.requestSent: 'requestSent',
  FollowStateDto.following: 'following',
};

_$_UserCountersDto _$$_UserCountersDtoFromJson(Map<String, dynamic> json) =>
    _$_UserCountersDto(
      followersCount: json['followersCount'] as int,
      followingsCount: json['followingsCount'] as int,
      notesCount: json['notesCount'] as int,
    );

Map<String, dynamic> _$$_UserCountersDtoToJson(_$_UserCountersDto instance) =>
    <String, dynamic>{
      'followersCount': instance.followersCount,
      'followingsCount': instance.followingsCount,
      'notesCount': instance.notesCount,
    };
