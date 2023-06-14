import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'get_comments_result_dto.freezed.dart';
part 'get_comments_result_dto.g.dart';

@freezed
class GetCommentsResultDto with _$GetCommentsResultDto {
  factory GetCommentsResultDto({
    required List<NoteDto> comments,
  }) = _GetCommentsResultDto;

  factory GetCommentsResultDto.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResultDtoFromJson(json);
}
