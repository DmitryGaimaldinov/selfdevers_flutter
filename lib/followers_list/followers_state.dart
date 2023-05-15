import '../profile/user.dart';

abstract class FollowersState {}

class FollowersStateInitializing extends FollowersState {}

class FollowersStateLoaded extends FollowersState {
  final List<User> followers;

  FollowersStateLoaded({required this.followers});
}

class FollowersStateError extends FollowersState {}