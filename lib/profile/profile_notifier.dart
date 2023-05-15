import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/status_codes.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/profile/profile_dto.dart';
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
      final response = await _ref.read(apiProvider).post(
        ApiServices.getUser,
        {
          'userTag': userTag,
          'fields': [ 'counters' ]
        }
      );

      final profileDto = ProfileDto.fromJson(response.data);
      setUserData(profileDto);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
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

  void setUserData(ProfileDto profileDto) {
    state = ProfileStateLoaded(profileDto);
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
