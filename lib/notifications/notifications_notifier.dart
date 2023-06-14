import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notifications/notifications_service.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:selfdevers/notifications/notifications_state.dart';

final notificationsStateProvider = StateNotifierProvider.autoDispose<
    NotificationsNotifier, NotificationsState>((ref) {
  return NotificationsNotifier(ref);
});

class NotificationsNotifier extends StateNotifier<NotificationsState> {
  final Ref _ref;

  NotificationsNotifier(this._ref) : super(NotificationsState.loading()) {
    _init();
  }

  Future<void> _init() async {
    final authState = _ref.watch(authStateProvider);

    if (authState is AuthStateNotLoggedIn) {
      state = NotificationsState.notLoggedIn();
    } else if (authState is AuthStateLoggedIn) {
      state = NotificationsState.loading();
      _loadNotifications();
    }
  }

  Future<void> _loadNotifications() async {
    final result =
        await _ref.read(notificationsServiceProvider).getNotifications();
    final notifications = result.notifications;
    final DateTime? lastViewed = result.lastViewed;

    int unreadCount;
    if (lastViewed == null) {
      unreadCount = notifications.length;
    } else {
      unreadCount = notifications
          .where((notification) => notification.date.isAfter(lastViewed))
          .length;
    }

    state = NotificationsState.loaded(
      notifications: notifications,
      unreadCount: unreadCount,
      lastViewed: lastViewed,
    );
  }

  Future<void> markAsViewed() async {
    await _ref.read(notificationsServiceProvider).markAsViewed();
  }
}
