import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/notes/dto/create_note_dto.dart';
import 'dto/get_feed_people_result_dto.dart';

final notesServiceProvider = Provider<NotesService>((ref) {
  return NotesService._(ref);
});

class NotesService {
  final Ref _ref;

  NotesService._(this._ref);

  Api get _api => _ref.read(apiProvider);

  /// Returns id of created note
  Future<int> createNote(CreateNoteDto createNoteDto, { CancelToken? cancelToken }) async {
    final response = await _api.post(
      'notes/create-note',
      createNoteDto.toJson(),
      cancelToken,
    );

    return int.parse(response.data);
  }

  Future<GetFeedPeopleResultDto> getFeedPeople() async {
    final response = await _api.post('notes/get-feed-people');
    return GetFeedPeopleResultDto.fromJson(response.data);
  }
}