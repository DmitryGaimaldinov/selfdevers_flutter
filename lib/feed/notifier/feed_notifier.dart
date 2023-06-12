import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notes/notes_service.dart';

import 'feed_state.dart';

final feedNotifierProvider = StateNotifierProvider
    .autoDispose<FeedNotifier, FeedState>((ref) {

  return FeedNotifier(ref);
});


class FeedNotifier extends StateNotifier<FeedState> {
  final Ref _ref;

  FeedNotifier(this._ref) : super(FeedState.initialing()) {
    _init();
  }

  Future<void> _init() async {
    final feedResult = await _ref.read(notesServiceProvider).getFeedPeople();

    print(feedResult.notes);

    state = FeedState.loaded(notes: feedResult.notes);
  }
}
