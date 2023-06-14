import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/profile/profile_notes_state.dart';

final profileNotesProvider = StateNotifierProvider.family.autoDispose<ProfileNotesNotifier, ProfileNotesState, String>((ref, userTag) {
  return ProfileNotesNotifier(ref, userTag);
});

class ProfileNotesNotifier extends StateNotifier<ProfileNotesState> {
  final Ref _ref;
  final String _userTag;

  ProfileNotesNotifier(this._ref, this._userTag) : super(ProfileNotesState.loading()) {
    _init();
  }

  Future<void> _init() async {
    final notes = await _ref.read(notesServiceProvider).getUserNotes(userTag: _userTag);
    state = ProfileNotesState.loaded(notes: notes);
  }
}
