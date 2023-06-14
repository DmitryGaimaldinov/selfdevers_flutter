import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/api/notifications/dto/follow_notification_content_dto.dart';
import 'package:selfdevers/api/notifications/dto/notification_dto.dart';
import 'package:selfdevers/api/notifications/dto/notification_type.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/widgets/user_name_tag_text.dart';

import '../../styles/text_styles.dart';

class NotificationTile extends StatelessWidget {
  // final VoidCallback? onPressed;
  final NotificationDto notificationDto;
  final bool isRead;

  const NotificationTile({
    Key? key,
    // this.onPressed,
    required this.notificationDto,
    required this.isRead,
  }) : super(key: key);

  Future<void> _onTap(BuildContext context) async {
    switch (notificationDto.content.notificationType) {
      case NotificationType.follow:
        final content = notificationDto.content as FollowNotificationContentDto;
        context.push('/profile/${content.follower.userTag}');
        break;
      case NotificationType.followRequest:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? leading;
    Widget? title;

    switch (notificationDto.content.notificationType) {
      case NotificationType.follow:
        final content = notificationDto.content as FollowNotificationContentDto;
        final UserDto follower = content.follower;
        final ImageDto? avatar = follower.avatar;
        leading = UserAvatar.network(avatar);
        title = Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: follower.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 4)),
              TextSpan(
                text: '@${follower.userTag}',
                style: TextStyles.light1.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const WidgetSpan(child: SizedBox(width: 4)),
              TextSpan(
                text: 'теперь читает вас'
              )
            ]
          )
        );
        break;
      case NotificationType.followRequest:
        return Text(
            'Сделать NotificationTile для ${notificationDto.content.notificationType}');
    }

    return ListTile(
      onTap: () => _onTap(context),
      leading: leading,
      title: title,
      subtitle: Text(DateFormat.MMMEd().format(notificationDto.date)),
    );
  }
}
