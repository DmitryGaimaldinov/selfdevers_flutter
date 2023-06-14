import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/users/get_followers_result_dto.dart';
import 'package:selfdevers/api/users/get_followings_result.dart';
import 'package:selfdevers/api/users/users_service.dart';

import 'followed_list_state.dart';

final followedListNotifierProvider = StateNotifierProvider
    .autoDispose.family<FollowedListNotifier, FollowedListState, int>((ref, userId) {
  return FollowedListNotifier(ref, userId);
});

class FollowedListNotifier extends StateNotifier<FollowedListState> {
  final Ref _ref;
  final int _userId;

  FollowedListNotifier(this._ref, this._userId) : super(FollowedListStateInitializing()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final followings = await _ref.read(usersServiceProvider).getFollowings(_userId);
      state = FollowedListStateLoaded(followedUsers: followings);
    } on DioError catch (e) {
      state = FollowedListStateError();
    }
  }
}
