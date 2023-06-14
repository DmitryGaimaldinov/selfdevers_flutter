import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'profile_notes_state.freezed.dart';

@freezed
class ProfileNotesState with _$ProfileNotesState {
  factory ProfileNotesState.loading() = _Loading;

  factory ProfileNotesState.loaded({ required List<NoteDto> notes }) = _Loaded;
}