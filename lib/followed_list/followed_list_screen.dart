import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/followed_list/followed_list_state.dart';
import 'package:selfdevers/followers_list/followers_list_screen.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/widgets/frosted_container.dart';
import 'package:selfdevers/widgets/my_divider.dart';

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
      body: FrostedContainer(
        child: Column(
          children: [
            AppBar(
              title: const Text('Список читаемых'),
              backgroundColor: Colors.transparent,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final followedListState = ref.watch(followedListNotifierProvider(userId));

                  if (followedListState is FollowedListStateInitializing) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (followedListState is FollowedListStateError) {
                    return Center(child: Text('Ошибка'));
                  }
                  else if (followedListState is FollowedListStateLoaded) {
                    final List<UserDto> followedUsers = followedListState.followedUsers;

                    if (followedUsers.isEmpty) {
                      return Center(child: Text('Нет читаемых :('));
                    }

                    return ListView.separated(
                      itemCount: followedUsers.length,
                      itemBuilder: (context, index) {
                        return UserTile(user: followedUsers[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const MyDivider();
                      },
                    );
                  }
                  else {
                    throw 'Не сделан экран для $followedListState';
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

