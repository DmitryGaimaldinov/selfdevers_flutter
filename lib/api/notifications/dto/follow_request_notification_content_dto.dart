import 'package:freezed_annotation/freezed_annotation.dart';

import '../../users/dto/user_dto.dart';
import 'notification_dto.dart';
import 'notification_type.dart';

part 'follow_request_notification_content_dto.freezed.dart';
part 'follow_request_notification_content_dto.g.dart';

@freezed
class FollowRequestNotificationContentDto extends NotificationContentDto with _$FollowRequestNotificationContentDto {
  factory FollowRequestNotificationContentDto({
    required UserDto follower,
    required NotificationType notificationType,
  }) = _FollowRequestNotificationContentDto;

  factory FollowRequestNotificationContentDto.fromJson(Map<String, dynamic> json)
  => _$FollowRequestNotificationContentDtoFromJson(json);
}