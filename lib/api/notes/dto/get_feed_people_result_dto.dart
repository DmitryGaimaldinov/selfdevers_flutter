import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'get_feed_people_result_dto.freezed.dart';
part 'get_feed_people_result_dto.g.dart';

@freezed
class GetFeedPeopleResultDto with _$GetFeedPeopleResultDto {
  factory GetFeedPeopleResultDto({
    required List<NoteDto> notes,
  }) = _GetFeedPeopleResultDto;

  factory GetFeedPeopleResultDto.fromJson(Map<String, dynamic> json) => _$GetFeedPeopleResultDtoFromJson(json);
}