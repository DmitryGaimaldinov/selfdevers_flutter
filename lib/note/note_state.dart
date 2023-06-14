import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'note_state.freezed.dart';

@freezed
class NoteState with _$NoteState {
  factory NoteState.loading() = _Loading;

  factory NoteState.loaded({ required NoteDto noteDto }) = _Loaded;

  factory NoteState.error() = _Error;
}