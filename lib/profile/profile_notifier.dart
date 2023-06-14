import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/followings/dto/follow_state_dto.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/status_codes.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/api/users/users_service.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/profile/profile_state.dart';
import 'package:selfdevers/profile/related_user_fields.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/profile/user_counter.dart';

final profileStateProvider = StateNotifierProvider.family.autoDispose<ProfileNotifier, ProfileState, String>((ref, userTag) {
  return ProfileNotifier(ref, userTag);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final Ref _ref;
  final String userTag;

  ProfileNotifier(this._ref, this.userTag) : super(ProfileState.loading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      final userDto = await _ref.read(usersServiceProvider).getUserByTag(userTag);
      setUserData(userDto);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        final response = e.response!;
        if (response.statusCode == StatusCodes.notFound) {
          state = ProfileState.notFound();
        } else {
          debugPrint(response.data);
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  void setUserData(UserDto userDto) {
    state = ProfileState.loaded(userDto: userDto);
  }

  Future<void> follow(int userId) async {
    final user = await _ref.read(usersServiceProvider).follow(userId);
    setUserData(user);
  }

  Future<void> unfollow(int userId) async {
    final user = await _ref.read(usersServiceProvider).unfollow(userId);
    setUserData(user);
  }
}
