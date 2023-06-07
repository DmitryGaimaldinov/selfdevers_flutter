import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notifications/dto/notification_dto.dart';

part 'get_notifications_result_dto.freezed.dart';
part 'get_notifications_result_dto.g.dart';

@freezed
class GetNotificationsResultDto with _$GetNotificationsResultDto {
  factory GetNotificationsResultDto({
    required DateTime? lastViewed,
    required List<NotificationDto> notifications,
  }) = _GetNotificationsResultDto;

  factory GetNotificationsResultDto.fromJson(Map<String, dynamic> json)
      => _$GetNotificationsResultDtoFromJson(json);
}
