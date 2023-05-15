import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/followers_list/followers_notifier.dart';
import 'package:selfdevers/followers_list/followers_state.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';

import '../profile/user.dart';
import '../profile/widgets/user_circle_avatar.dart';

class FollowersListScreen extends StatelessWidget {
  final int userId;

  const FollowersListScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список читателей'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final followersState = ref.watch(followersNotifierProvider(userId));

          if (followersState is FollowersStateInitializing) {
            return Center(child: CircularProgressIndicator());
          }
          else if (followersState is FollowersStateError) {
            return Center(child: Text('Ошибка'));
          }
          else if (followersState is FollowersStateLoaded) {
            final List<User> followers = followersState.followers;

            if (followers.isEmpty) {
              return Center(child: Text('Нет читателей :('));
            }

            return ListView.builder(
                itemCount: followers.length,
                itemBuilder: (context, index) {
                  return _FollowerTile(user: followers[index]);
                }
            );
          }
          else {
            throw 'Не сделан экран для $followersState';
          }
        },
      ),
    );
  }
}

class _FollowerTile extends StatelessWidget {
  final User user;

  const _FollowerTile({
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
      leading: CircleUserAvatar(
        imageProvider: (user.avatarUrl != null)
            ? NetworkImage(user.avatarUrl!)
            : null,
      ),
      title: Text(user.name),
      subtitle: Text(user.userTag),
    );
  }
}

