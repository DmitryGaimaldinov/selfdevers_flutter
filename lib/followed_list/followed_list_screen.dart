import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/followed_list/followed_list_state.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';

import '../profile/user.dart';
import '../profile/widgets/user_avatar.dart';
import 'followed_list_notifier.dart';

class FollowedListScreen extends StatelessWidget {
  final int userId;

  const FollowedListScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список читаемых'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final followedListState = ref.watch(followedListNotifierProvider(userId));

          if (followedListState is FollowedListStateInitializing) {
            return Center(child: CircularProgressIndicator());
          }
          else if (followedListState is FollowedListStateError) {
            return Center(child: Text('Ошибка'));
          }
          else if (followedListState is FollowedListStateLoaded) {
            final List<User> followedUsers = followedListState.followedUsers;

            if (followedUsers.isEmpty) {
              return Center(child: Text('Нет читаемых :('));
            }

            return ListView.builder(
                itemCount: followedUsers.length,
                itemBuilder: (context, index) {
                  return _FollowedUserTile(user: followedUsers[index]);
                }
            );
          }
          else {
            throw 'Не сделан экран для $followedListState';
          }
        },
      ),
    );
  }
}

class _FollowedUserTile extends StatelessWidget {
  final User user;

  const _FollowedUserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProfileScreen(userTag: user.userTag),
        ));
      },
      // Сделать какой-нибудь UserAvatar
      leading: UserAvatar(
        imageProvider: (user.avatarUrl != null)
            ? NetworkImage(user.avatarUrl!)
            : null,
      ),
      title: Text(user.name),
      subtitle: Text(user.userTag),
    );
  }
}

