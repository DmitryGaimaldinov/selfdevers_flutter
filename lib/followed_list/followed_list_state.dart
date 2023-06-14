import 'package:selfdevers/api/users/dto/user_dto.dart';

import '../profile/user.dart';

abstract class FollowedListState {}

class FollowedListStateInitializing extends FollowedListState {}

class FollowedListStateLoaded extends FollowedListState {
  final List<UserDto> followedUsers;

  FollowedListStateLoaded({required this.followedUsers});
}

class FollowedListStateError extends FollowedListState {}