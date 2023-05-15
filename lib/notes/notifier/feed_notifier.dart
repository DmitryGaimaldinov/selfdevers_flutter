import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/notes/api/notes_service.dart';
import 'package:selfdevers/notes/notifier/feed_state.dart';

final feedNotifierProvider = StateNotifierProvider
    .autoDispose<FeedNotifier, FeedState>((ref) {

  return FeedNotifier(ref);
});


class FeedNotifier extends StateNotifier<FeedState> {
  final Ref _ref;

  FeedNotifier(this._ref) : super(FeedStateInitializing()) {
    _init();
  }

  Future<void> _init() async {
    final notes = await _ref.read(notesServiceProvider).getNotes();

    state = FeedStateLoaded(notes: notes);
  }
}
