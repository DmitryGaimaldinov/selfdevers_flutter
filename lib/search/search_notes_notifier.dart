import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/feed/note.dart';
import 'package:selfdevers/search/search_notes_state.dart';
import 'package:selfdevers/search/search_screen.dart';

final searchNotesProvider = StateNotifierProvider<SearchNotesNotifier, SearchNotesState>((ref) {
  return SearchNotesNotifier(ref);
});


class SearchNotesNotifier extends StateNotifier<SearchNotesState> {
  final Ref _ref;

  SearchNotesNotifier(this._ref) : super(SearchNotesState.loading());

  Future<void> searchNotes({ required String text, required FilterNotesType filterNotesType }) async {
    print('search notes');
    print('search notes. type: $filterNotesType');
    switch (filterNotesType) {
      case FilterNotesType.latest:
        _searchLatestNotes(text: text);
        break;
      case FilterNotesType.popular:
        _searchPopularNotes(text: text);
        break;
    }
  }

  Future<void> _searchLatestNotes({ required String text }) async {
    final notes = await _ref.read(notesServiceProvider).searchLatestNotes(text: text);
    state = SearchNotesState.loaded(notes: notes);
  }

  Future<void> _searchPopularNotes({ required String text }) async {
    final notes = await _ref.read(notesServiceProvider).searchPopularNotes(text: text);
    state = SearchNotesState.loaded(notes: notes);
  }
}
