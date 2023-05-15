import '../profile/user.dart';

abstract class FollowedListState {}

class FollowedListStateInitializing extends FollowedListState {}

class FollowedListStateLoaded extends FollowedListState {
  final List<User> followedUsers;

  FollowedListStateLoaded({required this.followedUsers});
}

class FollowedListStateError extends FollowedListState {}