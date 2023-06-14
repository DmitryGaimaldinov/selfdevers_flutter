import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/notes/dto/create_note_dto.dart';
import 'package:selfdevers/api/notes/dto/get_comments_result_dto.dart';
import 'package:selfdevers/api/notes/dto/get_user_notes_result_dto.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/notes/dto/search_notes_result_dto.dart';
import 'dto/get_feed_people_result_dto.dart';

final notesServiceProvider = Provider<NotesService>((ref) {
  return NotesService._(ref);
});

class NotesService {
  final Ref _ref;

  NotesService._(this._ref);

  Api get _api => _ref.read(apiProvider);

  /// Returns created note
  Future<NoteDto> createNote(CreateNoteDto createNoteDto,
      {CancelToken? cancelToken}) async {
    final response = await _api.post(
      'notes/create-note',
      createNoteDto.toJson(),
      cancelToken,
    );

    return NoteDto.fromJson(response.data);
  }

  Future<GetFeedPeopleResultDto> getFeedPeople() async {
    final response = await _api.post('notes/get-feed-people');
    return GetFeedPeopleResultDto.fromJson(response.data);
  }

  Future<void> like({ required int noteId }) async {
    await _api.post('likes/like-note', { 'noteId': noteId });
  }

  Future<void> unlike({ required int noteId }) async {
    await _api.delete('likes/delete-note-like', { 'noteId': noteId });
  }

  Future<NoteDto> getNoteById(int id) async {
    final response = await _api.post('notes/get-note-by-id', { 'noteId': id });
    return NoteDto.fromJson(response.data);
  }

  Future<List<NoteDto>> getUserNotes({ required String userTag}) async {
    final response = await _api.post('notes/get-user-notes', { 'userTag': userTag });
    return GetUserNotesResultDto.fromJson(response.data).notes;
  }

  Future<List<NoteDto>> getComments({ required int noteId }) async {
    final response = await _api.post('notes/get-comments', { 'noteId': noteId });
    return GetCommentsResultDto.fromJson(response.data).comments;
  }

  Future<List<NoteDto>> searchLatestNotes({ required String text }) async {
    final response = await _api.post('notes/get-latest-notes', { 'text': text });
    return SearchNotesResultDto.fromJson(response.data).notes;
  }

  Future<List<NoteDto>> searchPopularNotes({ required String text }) async {
    final response = await _api.post('notes/get-popular-notes', { 'text': text });
    return SearchNotesResultDto.fromJson(response.data).notes;
  }
}
