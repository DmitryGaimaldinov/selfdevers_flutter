import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'note_comments_state.freezed.dart';

@freezed
class NoteCommentsState with _$NoteCommentsState {
  factory NoteCommentsState.loading() = _Loading;

  factory NoteCommentsState.loaded({ required List<NoteDto> comments }) = _Loaded;
}