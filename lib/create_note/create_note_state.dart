import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_note_state.freezed.dart';

@freezed
class CreateNoteState with _$CreateNoteState {
  const factory CreateNoteState({required bool isSending}) = _CreateNoteState;
}
