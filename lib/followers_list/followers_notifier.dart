import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/users/get_followers_result_dto.dart';
import 'package:selfdevers/api/users/users_service.dart';

import 'followers_state.dart';

final followersNotifierProvider = StateNotifierProvider
    .autoDispose.family<FollowersNotifier, FollowersState, int>((ref, userId) {
      return FollowersNotifier(ref, userId);
});

class FollowersNotifier extends StateNotifier<FollowersState> {
  final Ref _ref;
  final int _userId;

  FollowersNotifier(this._ref, this._userId) : super(FollowersStateInitializing()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final followers = await _ref.read(usersServiceProvider).getFollowers(_userId);
      state = FollowersStateLoaded(followers: followers);
    } on DioError catch (e) {
      state = FollowersStateError();
    }
  }
}
