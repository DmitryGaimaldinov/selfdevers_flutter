import 'package:freezed_annotation/freezed_annotation.dart';

import '../../users/dto/user_dto.dart';

part 'follow_request_notification_content_dto.freezed.dart';
part 'follow_request_notification_content_dto.g.dart';

@freezed
class FollowRequestNotificationContentDto with _$FollowRequestNotificationContentDto {
  factory FollowRequestNotificationContentDto({
    required UserDto follower,
  }) = _FollowRequestNotificationContentDto;

  factory FollowRequestNotificationContentDto.fromJson(Map<String, dynamic> json)
  => _$FollowRequestNotificationContentDtoFromJson(json);
}