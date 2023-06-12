// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_notification_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowNotificationContentDto _$$_FollowNotificationContentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_FollowNotificationContentDto(
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
      follower: UserDto.fromJson(json['follower'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FollowNotificationContentDtoToJson(
        _$_FollowNotificationContentDto instance) =>
    <String, dynamic>{
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
      'follower': instance.follower,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.follow: 'follow',
  NotificationType.followRequest: 'followRequest',
};
