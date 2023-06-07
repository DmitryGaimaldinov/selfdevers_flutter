// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDto _$$_NotificationDtoFromJson(Map<String, dynamic> json) =>
    _$_NotificationDto(
      id: json['id'] as int,
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
      date: DateTime.parse(json['date'] as String),
      content:
          NotificationDto.mapContent(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationDtoToJson(_$_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
      'date': instance.date.toIso8601String(),
      'content': instance.content,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.follow: 'follow',
  NotificationType.followRequest: 'followRequest',
};
