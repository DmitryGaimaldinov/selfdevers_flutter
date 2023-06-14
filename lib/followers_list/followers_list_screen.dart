import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/followers_list/followers_notifier.dart';
import 'package:selfdevers/followers_list/followers_state.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/widgets/frosted_container.dart';
import 'package:selfdevers/widgets/my_divider.dart';

import '../profile/user.dart';
import '../profile/widgets/user_avatar.dart';

class FollowersScreen extends StatelessWidget {
  final int userId;

  const FollowersScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FrostedContainer(
        child: Column(
          children: [
            AppBar(
              title: const Text('Список читателей'),
              backgroundColor: Colors.transparent,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final followersState = ref.watch(followersNotifierProvider(userId));

                  if (followersState is FollowersStateInitializing) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (followersState is FollowersStateError) {
                    return Center(child: Text('Ошибка'));
                  }
                  else if (followersState is FollowersStateLoaded) {
                    final List<UserDto> followers = followersState.followers;

                    if (followers.isEmpty) {
                      return Center(child: Text('Нет читателей :('));
                    }

                    return ListView.separated(
                      itemCount: followers.length,
                      itemBuilder: (context, index) {
                        return UserTile(user: followers[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const MyDivider();
                      },
                    );
                  }
                  else {
                    throw 'Не сделан экран для $followersState';
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final UserDto user;

  const UserTile({
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
      leading: UserAvatar.network(user.avatar),
      title: Text(user.name),
      subtitle: Text('@${user.userTag}'),
    );
  }
}

