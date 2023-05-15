// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCounter _$UserCounterFromJson(Map<String, dynamic> json) => UserCounter(
      counterType: $enumDecode(_$UserCounterTypeEnumMap, json['counterType']),
      count: json['count'] as int,
    );

Map<String, dynamic> _$UserCounterToJson(UserCounter instance) =>
    <String, dynamic>{
      'count': instance.count,
      'counterType': _$UserCounterTypeEnumMap[instance.counterType]!,
    };

const _$UserCounterTypeEnumMap = {
  UserCounterType.followers: 'followers',
  UserCounterType.followings: 'followings',
};
