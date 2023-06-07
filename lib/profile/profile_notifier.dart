import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/followings/dto/follow_state_dto.dart';
import 'package:selfdevers/api/status_codes.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/profile/profile_state.dart';
import 'package:selfdevers/profile/related_user_fields.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/profile/user_counter.dart';

final profileNotifierProvider = StateNotifierProvider.family.autoDispose<ProfileNotifier, ProfileState, String>((ref, userTag) {
  return ProfileNotifier(ref, userTag);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final Ref _ref;
  final String userTag;

  ProfileNotifier(this._ref, this.userTag) : super(ProfileStateLoading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      // final response = await _ref.read(apiProvider).post(
      //   ApiServices.getUser,
      //   {
      //     'userTag': userTag,
      //   }
      // );
      //
      // final profileDto = ProfileDto.fromJson(response.data);
      setUserData(UserDto(
          id: 0,
          name: 'Имя профиля',
          userTag: userTag,
          description: 'Суперское описание профиля',
          registerDate: DateTime.now(),
          isPrivate: false,
          counters: UserCountersDto(followersCount: 0, followingsCount: 0, notesCount: 0),
          isMe: true,
          followState: FollowStateDto.following,
      ));
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        final response = e.response!;
        if (response.statusCode == StatusCodes.notFound) {
          state = ProfileStateNotFound();
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
    state = ProfileStateLoaded(userDto);
  }

  Future<void> follow(int userId) async {
    if (state is ProfileStateLoaded) {
      await _ref.read(apiProvider).post(
          ApiServices.follow,
          {
            'followedUserId': userId,
          }
      );
      await loadUser();
    }
  }

  Future<void> unfollow(int userId) async {
    if (state is ProfileStateLoaded) {
      await _ref.read(apiProvider).post(
          ApiServices.unfollow,
          {
            'followedUserId': userId,
          }
      );
      await loadUser();
    }
  }
}
