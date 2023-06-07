// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_notification_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowNotificationContentDto _$$_FollowNotificationContentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_FollowNotificationContentDto(
      follower: UserDto.fromJson(json['follower'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FollowNotificationContentDtoToJson(
        _$_FollowNotificationContentDto instance) =>
    <String, dynamic>{
      'follower': instance.follower,
    };
