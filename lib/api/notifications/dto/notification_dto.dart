import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notifications/dto/follow_notification_content_dto.dart';
import 'package:selfdevers/api/notifications/dto/follow_request_notification_content_dto.dart';

import 'notification_type.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationContentDto {
  final NotificationType notificationType;

  NotificationContentDto({required this.notificationType});

  factory NotificationContentDto.fromJson(Map<String, dynamic> json) => _$NotificationContentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationContentDtoToJson(this);
}

@freezed
// TODO: Сделать NotificationDto через обычный класс.
// Сгенерировать equals через alt + insert
class NotificationDto with _$NotificationDto {
  factory NotificationDto({
    required int id,
    required DateTime date,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: NotificationDto.mapContent) required NotificationContentDto content,
  }) = _NotificationDto;

  static NotificationContentDto mapContent(Map<String, dynamic> contentJson)  {
    final notificationTypeString = contentJson['notificationType'];

    switch (notificationTypeString) {
      case 'follow':
        return FollowNotificationContentDto.fromJson(contentJson);
      case 'followRequest':
        return FollowRequestNotificationContentDto.fromJson(contentJson);
      default:
        throw 'Нет маппера для notificationType: $notificationTypeString';
    }
  }

  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);
}
