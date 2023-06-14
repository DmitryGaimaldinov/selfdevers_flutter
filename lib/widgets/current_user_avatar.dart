import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/api/users/users_service.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import '../api/users/dto/user_dto.dart';
import '../profile/widgets/user_avatar.dart';

// final currentUserAvatarProvider = Provider<ImageDto?>((ref) {
//   final currentUser = ref.watch(currentUserProvider);
//   if (currentUser == null) {
//     return null;
//   }
//
//   return currentUser.avatar;
// });

/// Виджет для отображения текущей аватарки пользователя в AppBar
// class CurrentUserAvatar extends ConsumerWidget {
//   const CurrentUserAvatar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final UserDto? user = ref.watch(currentUserProvider);
//
//     if (user == null) {
//       return SizedBox();
//     }
//
//     final ImageDto? avatar = user.avatar;
//     return Padding(
//         padding: const EdgeInsets.all(12),
//         child: UserAvatar(
//           imageProvider: (avatar?.url != null)
//               ? NetworkImage(avatar!.url)
//               : null,
//           blurhash: avatar?.blurhash,
//         )
//     );
//   }
// }
