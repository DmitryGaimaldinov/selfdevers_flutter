// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetNotificationsResultDto _$$_GetNotificationsResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_GetNotificationsResultDto(
      lastViewed: json['lastViewed'] == null
          ? null
          : DateTime.parse(json['lastViewed'] as String),
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetNotificationsResultDtoToJson(
        _$_GetNotificationsResultDto instance) =>
    <String, dynamic>{
      'lastViewed': instance.lastViewed?.toIso8601String(),
      'notifications': instance.notifications,
    };
