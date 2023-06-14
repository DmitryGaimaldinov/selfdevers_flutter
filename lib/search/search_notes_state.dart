import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/feed/note.dart';

part 'search_notes_state.freezed.dart';

@freezed
class SearchNotesState with _$SearchNotesState {
  factory SearchNotesState.loading({
    @Default([]) List<NoteDto> notes,
    // @Default([]) List<UserDto> users,
  }) = _Loading;

  factory SearchNotesState.loaded({
    required List<NoteDto> notes,
    // required List<UserDto> users,
  }) = _Loaded;

  // error может быть как во время загрузки ещё большего кол-ва постов,
  // так и во время загрузки постов по другому запросу.
  factory SearchNotesState.error() = _Error;
}
