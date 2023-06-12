import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notifications/notifications_service.dart';

class NotificationsIcon extends ConsumerWidget {
  const NotificationsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(unreadNotificationsCountProvider);

    Widget icon = const Icon(Icons.notifications);
    if (count == null || count == 0) {
      return icon;
    }

    return Badge.count(count: count, child: icon);
  }
}
