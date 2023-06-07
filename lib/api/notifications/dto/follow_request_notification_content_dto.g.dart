// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request_notification_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowRequestNotificationContentDto
    _$$_FollowRequestNotificationContentDtoFromJson(
            Map<String, dynamic> json) =>
        _$_FollowRequestNotificationContentDto(
          follower: UserDto.fromJson(json['follower'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_FollowRequestNotificationContentDtoToJson(
        _$_FollowRequestNotificationContentDto instance) =>
    <String, dynamic>{
      'follower': instance.follower,
    };
