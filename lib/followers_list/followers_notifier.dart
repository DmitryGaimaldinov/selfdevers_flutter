import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/users/get_followers_result.dart';

import 'followers_state.dart';

final followersNotifierProvider = StateNotifierProvider
    .autoDispose.family<FollowersNotifier, FollowersState, int>((ref, userId) {
      return FollowersNotifier(ref, userId);
});

class FollowersNotifier extends StateNotifier<FollowersState> {
  final Ref _ref;
  final int _userId;
  DateTime? _beforeDate;

  FollowersNotifier(this._ref, this._userId) : super(FollowersStateInitializing()) {
    _init();
  }

  Future<void> _init() async {
    loadMore();
  }

  Future<void> loadMore() async {
    if (state is FollowersStateLoaded && _beforeDate == null) {
      return;
    }
    try {
      final Map<String, dynamic> requestData = { 'userId': _userId };
      if (_beforeDate != null) {
        requestData['beforeDate'] = _beforeDate!.toIso8601String();
      }

      final followersResponse = await _ref.read(apiProvider).post(
          ApiServices.getFollowers,
          requestData,
      );
      final result = GetFollowersResult.fromJson(followersResponse.data);

      _beforeDate = result.beforeDate;
      state = FollowersStateLoaded(followers: result.followers);
    } on DioError catch (e) {
      print(e.message);
      state = FollowersStateError();
    }
  }

  Future<void> refresh() async {

  }
}
