// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_followings_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFollowingsResult _$GetFollowingsResultFromJson(Map<String, dynamic> json) =>
    GetFollowingsResult(
      followedUsers: (json['followedUsers'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeDate: json['beforeDate'] == null
          ? null
          : DateTime.parse(json['beforeDate'] as String),
    );

Map<String, dynamic> _$GetFollowingsResultToJson(
        GetFollowingsResult instance) =>
    <String, dynamic>{
      'followedUsers': instance.followedUsers,
      'beforeDate': instance.beforeDate?.toIso8601String(),
    };
