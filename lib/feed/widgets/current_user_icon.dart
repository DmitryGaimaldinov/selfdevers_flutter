import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/home/widgets/current_user_in_rail.dart';

class CurrentUserIcon extends ConsumerWidget {
  const CurrentUserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDto? currUser = ref.watch(currentUserProvider);

    if (currUser == null) {
      return Icon(Icons.person);
    }

    return CurrentUserAvatar(
      radius: 14,
    );
  }
}
