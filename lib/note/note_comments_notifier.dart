import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/note/note_comments_state.dart';

final noteCommentsProvider = StateNotifierProvider.autoDispose.family<NoteCommentsNotifier, NoteCommentsState, int>((ref, noteId) {
  return NoteCommentsNotifier(ref, noteId);
});


class NoteCommentsNotifier extends StateNotifier<NoteCommentsState> {
  final Ref _ref;
  final int _noteId;

  NoteCommentsNotifier(this._ref, this._noteId) : super(NoteCommentsState.loading()) {
    _loadComments();
  }

  Future<void> _loadComments() async {
    final comments = await _ref.read(notesServiceProvider).getComments(noteId: _noteId);
    state = NoteCommentsState.loaded(comments: comments);
  }

  Future<void> refresh() async {
    await _loadComments();
  }
}
