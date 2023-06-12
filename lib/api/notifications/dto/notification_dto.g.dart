// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationContentDto _$NotificationContentDtoFromJson(
        Map<String, dynamic> json) =>
    NotificationContentDto(
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
    );

Map<String, dynamic> _$NotificationContentDtoToJson(
        NotificationContentDto instance) =>
    <String, dynamic>{
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.follow: 'follow',
  NotificationType.followRequest: 'followRequest',
};

_$_NotificationDto _$$_NotificationDtoFromJson(Map<String, dynamic> json) =>
    _$_NotificationDto(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      content:
          NotificationDto.mapContent(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationDtoToJson(_$_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'content': instance.content,
    };
