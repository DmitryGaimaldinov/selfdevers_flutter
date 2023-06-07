import 'package:freezed_annotation/freezed_annotation.dart';

import '../../users/dto/user_dto.dart';

part 'follow_notification_content_dto.freezed.dart';
part 'follow_notification_content_dto.g.dart';

@freezed
class FollowNotificationContentDto with _$FollowNotificationContentDto {
  factory FollowNotificationContentDto({
    required UserDto follower,
  }) = _FollowNotificationContentDto;

  factory FollowNotificationContentDto.fromJson(Map<String, dynamic> json)
      => _$FollowNotificationContentDtoFromJson(json);
}