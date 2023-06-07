import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/notifications/dto/get_notifications_result_dto.dart';
import 'package:selfdevers/api/notifications/dto/notification_dto.dart';

final notificationsServiceProvider = Provider<NotificationsService>((ref) {
  return NotificationsService(ref);
});

class NotificationsService {
  final Ref _ref;

  NotificationsService(this._ref);

  Future<GetNotificationsResultDto> getNotifications() async {
    final response = await _ref.read(apiProvider).post('notifications/get-notifications');
    return GetNotificationsResultDto.fromJson(response.data);
  }
}