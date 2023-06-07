import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/api/notifications/dto/notification_dto.dart';
import 'package:selfdevers/main.dart';

class NotificationTile extends StatelessWidget {
  final VoidCallback? onPressed;
  final NotificationDto notificationDto;
  final bool isRead;

  const NotificationTile({
    Key? key,
    this.onPressed,
    required this.notificationDto,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterConstrained(
      child: ListTile(
        onTap: onPressed,
        title: Text('NOTIFICATIOND ID: ${notificationDto.id}'),
        subtitle: Text(DateFormat.MMMEd().format(notificationDto.date)),
      ),
    );
  }
}
