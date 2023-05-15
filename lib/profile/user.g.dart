// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      userTag: json['userTag'] as String,
      description: json['description'] as String,
      registerDate: json['registerDate'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      backgroundUrl: json['backgroundUrl'] as String?,
      isPrivate: json['isPrivate'] as bool,
      counters: (json['counters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$UserCounterTypeEnumMap, k), e as int),
      ),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userTag': instance.userTag,
      'description': instance.description,
      'registerDate': instance.registerDate,
      'avatarUrl': instance.avatarUrl,
      'backgroundUrl': instance.backgroundUrl,
      'isPrivate': instance.isPrivate,
      'counters': instance.counters
          ?.map((k, e) => MapEntry(_$UserCounterTypeEnumMap[k]!, e)),
    };

const _$UserCounterTypeEnumMap = {
  UserCounterType.followers: 'followers',
  UserCounterType.followings: 'followings',
};
