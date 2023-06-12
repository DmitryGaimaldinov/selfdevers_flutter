import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/notifications/dto/get_notifications_result_dto.dart';
import 'package:selfdevers/api/ws_api.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final unreadNotificationsCountProvider = StateProvider<int?>((ref) {
  return null;
});

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

  // Future<int> getUnreadCount() {
  //   final completer = Completer<int>();
  //   _ref.watch(wsApiProvider).socket.emitWithAck(
  //     'get-unread-notifications-count',
  //     null,
  //     ack: (count) {
  //       print('get-unread-notifications-count: $count');
  //       _unreadCountController.add(count);
  //       completer.complete(count);
  //     },
  //   );
  //
  //   return completer.future;
  // }
}