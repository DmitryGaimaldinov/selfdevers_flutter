import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notifications/dto/notification_dto.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  factory NotificationsState.loading() = _Loading;

  factory NotificationsState.notLoggedIn() = _NotLoggedIn;

  factory NotificationsState.loaded({
    required List<NotificationDto> notifications,
    required int unreadCount,
    required DateTime? lastViewed,
  }) = _Loaded;
}