import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'get_user_notes_result_dto.freezed.dart';
part 'get_user_notes_result_dto.g.dart';

@freezed
class GetUserNotesResultDto with _$GetUserNotesResultDto {
  factory GetUserNotesResultDto({
    required List<NoteDto> notes,
  }) = _GetUserNotesResultDto;

  factory GetUserNotesResultDto.fromJson(Map<String, dynamic> json) =>
      _$GetUserNotesResultDtoFromJson(json);
}
