import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'search_notes_result_dto.freezed.dart';
part 'search_notes_result_dto.g.dart';

@freezed
class SearchNotesResultDto with _$SearchNotesResultDto {
  factory SearchNotesResultDto({
    required List<NoteDto> notes
  }) = _SearchNotesResultDto;

  factory SearchNotesResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchNotesResultDtoFromJson(json);
}
