import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/feed/note.dart';

part 'search_notes_state.freezed.dart';

@freezed
class SearchNotesState with _$SearchNotesState {
  factory SearchNotesState.loading({
    @Default([]) List<Note> notes
  }) = _Loading;

  factory SearchNotesState.loaded({
    required List<Note> notes,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;

  // error может быть как во время загрузки ещё большего кол-ва постов,
  // так и во время загрузки постов по другому запросу.
  factory SearchNotesState.error({
    required List<Note> notes
  }) = _Error;
}

// class SearchResult {
//   List<Note> notes;
//   List<Club> clubs;
//   List<Challenge> challenges;
//   List<User> users;
// }
