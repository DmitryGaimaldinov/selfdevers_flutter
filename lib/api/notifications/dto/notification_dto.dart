import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notifications/dto/follow_notification_content_dto.dart';
import 'package:selfdevers/api/notifications/dto/follow_request_notification_content_dto.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@JsonEnum(alwaysCreate: true)
enum NotificationType {
  follow,
  followRequest,
}

@freezed
class NotificationDto with _$NotificationDto {
  factory NotificationDto({
    required int id,
    required NotificationType notificationType,
    required DateTime date,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: NotificationDto.mapContent) required Object content,
  }) = _NotificationDto;

  static Object mapContent(Map<String, dynamic> value)  {
    if (value['notificationType'] == 'follow') {
      FollowNotificationContentDto.fromJson(value['content']);
    }

    return FollowRequestNotificationContentDto.fromJson(value['content']);
  }

  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);
}
