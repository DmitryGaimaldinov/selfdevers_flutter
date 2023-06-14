import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/widgets/current_user_avatar.dart';

class CurrentUserAvatar extends ConsumerWidget {
  final double? radius;
  final VoidCallback? onTap;

  const CurrentUserAvatar({
    Key? key,
    this.radius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDto? currUser = ref.watch(currentUserProvider);

    if (currUser == null) {
      return const SizedBox();
    }

    return UserAvatar.network(
      currUser.avatar,
      radius: radius,
    );
  }
}
