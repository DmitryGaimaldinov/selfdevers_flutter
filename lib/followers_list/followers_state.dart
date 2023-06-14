import 'package:selfdevers/api/users/dto/user_dto.dart';

import '../profile/user.dart';

abstract class FollowersState {}

class FollowersStateInitializing extends FollowersState {}

class FollowersStateLoaded extends FollowersState {
  final List<UserDto> followers;

  FollowersStateLoaded({required this.followers});
}

class FollowersStateError extends FollowersState {}