import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/users/get_followers_result.dart';
import 'package:selfdevers/api/users/get_followings_result.dart';

import 'followed_list_state.dart';

final followedListNotifierProvider = StateNotifierProvider
    .autoDispose.family<FollowedListNotifier, FollowedListState, int>((ref, userId) {
  return FollowedListNotifier(ref, userId);
});

class FollowedListNotifier extends StateNotifier<FollowedListState> {
  final Ref _ref;
  final int _userId;
  DateTime? _beforeDate;

  FollowedListNotifier(this._ref, this._userId) : super(FollowedListStateInitializing()) {
    _init();
  }

  Future<void> _init() async {
    loadMore();
  }

  Future<void> loadMore() async {
    if (state is FollowedListStateLoaded && _beforeDate == null) {
      return;
    }
    try {
      final Map<String, dynamic> requestData = { 'userId': _userId };
      if (_beforeDate != null) {
        requestData['beforeDate'] = _beforeDate!.toIso8601String();
      }

      final followersResponse = await _ref.read(apiProvider).post(
        ApiServices.getFollowings,
        requestData,
      );
      final result = GetFollowingsResult.fromJson(followersResponse.data);

      _beforeDate = result.beforeDate;
      state = FollowedListStateLoaded(followedUsers: result.followedUsers);
    } on DioError catch (e) {
      print(e.message);
      state = FollowedListStateError();
    }
  }

  Future<void> refresh() async {

  }
}
