import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';

import '../note.dart';

final notesServiceProvider = Provider<NotesService>((ref) {
  return NotesService._(ref);
});

class NotesService {
  final Ref _ref;

  NotesService._(this._ref);

  final _baseMethodName = 'notes';

  String makeMethodName(String method) {
    return '$_baseMethodName/$method';
  }

  Future<Note> createNote({ required String text }) async {
    final response = await _ref.read(apiProvider).post(
      makeMethodName('create-note'),
      {
        text: text,
      }
    );

    return Note.fromJson(response.data);
  }

  Future<List<Note>> getNotes() async {
    final response = await _ref.read(apiProvider).get(_baseMethodName);
    return (response.data as List)
        .map((e) => Note.fromJson(e))
        .toList();
  }
}
