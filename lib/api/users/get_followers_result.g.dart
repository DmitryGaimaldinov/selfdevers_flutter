// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_followers_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFollowersResult _$GetFollowersResultFromJson(Map<String, dynamic> json) =>
    GetFollowersResult(
      followers: (json['followers'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeDate: json['beforeDate'] == null
          ? null
          : DateTime.parse(json['beforeDate'] as String),
    );

Map<String, dynamic> _$GetFollowersResultToJson(GetFollowersResult instance) =>
    <String, dynamic>{
      'followers': instance.followers,
      'beforeDate': instance.beforeDate?.toIso8601String(),
    };
