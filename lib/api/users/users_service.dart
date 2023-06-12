import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';

final usersServiceProvider = Provider<UsersService>((ref) {
  return UsersService(ref);
});

class UsersService {
  final Ref _ref;
  UsersService(this._ref);

  Api get _api => _ref.read(apiProvider);

  Future<UserDto> getUserByTag(String tag) async {
    final response = await _api.post(
        'users/get-user',
        { 'userTag': tag });

    return UserDto.fromJson(response.data);
  }

  Future<UserDto> getUserById(int id) async {
    return getUserByTag('id$id');
  }

  Future<UserDto> follow(int userId) async {
    final response = await _api.post(
      'users/follow',
      { 'userId': userId },
    );

    return UserDto.fromJson(response.data);
  }

  Future<UserDto> unfollow(int userId) async {
    final response = await _api.post(
      'users/unfollow',
      { 'userId': userId },
    );

    return UserDto.fromJson(response.data);
  }
}