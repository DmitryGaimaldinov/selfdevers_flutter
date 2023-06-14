import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/notifications/notifications_notifier.dart';
import 'package:selfdevers/notifications/widgets/notification_tile.dart';
import 'package:selfdevers/widgets/login/login_button.dart';
import 'package:selfdevers/widgets/my_divider.dart';


import '../auth/show_login_dialog.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(notificationsStateProvider.notifier).markAsViewed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Уведомления')),
      body: const _NotificationsListView(),
    );
  }
}

class _NotificationsListView extends ConsumerWidget {
  const _NotificationsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsState = ref.watch(notificationsStateProvider);

    return notificationsState.when(
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      loaded: (notifications, unreadCount, lastViewed) {
        if (notifications.isEmpty) {
          return Center(child: Text('Уведомлений нет'));
        }

        return ListView.separated(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];

            return NotificationTile(
              notificationDto: notification,
              isRead: (lastViewed == null)
                  ? false
                  : notification.date.isAfter(lastViewed),
            );
          },
          separatorBuilder: (context, index) {
            return const MyDivider();
          },
        );
      },
      notLoggedIn: () {
        // return Center(
        //   child: _buildCheckSocketButton(),
        // );

        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Войдите, чтобы просматривать уведомления',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              FilledButton(
                onPressed: () => showLoginDialog(context),
                child: Text('Войти'),
              ),
            ],
          ),
        );
      }
    );
  }

  // Widget _buildCheckSocketButton() {
  //   return FilledButton(
  //     onPressed: () {
  //
  //       socket.onConnect((data) {
  //         debugPrint('SOCKET CONNECTED. data: $data');
  //       });
  //
  //     },
  //     child: Text('SOCKET BITCH'),
  //   );
  // }
}
