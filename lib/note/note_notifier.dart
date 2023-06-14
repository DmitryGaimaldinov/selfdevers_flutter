import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/note/note_state.dart';

final noteStateProvider = StateNotifierProvider.family.autoDispose<NoteNotifier, NoteState, int>((ref, noteId) {
  return NoteNotifier(ref, noteId);
});


class NoteNotifier extends StateNotifier<NoteState> {
  final int noteId;
  final Ref _ref;

  NoteNotifier(this._ref, this.noteId) : super(NoteState.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final noteDto = await _ref.read(notesServiceProvider).getNoteById(noteId);
      state = NoteState.loaded(noteDto: noteDto);
    } catch (e) {
      state = NoteState.error();
    }
  }
}
