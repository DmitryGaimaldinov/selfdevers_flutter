import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';

part 'note_dto.freezed.dart';
part 'note_dto.g.dart';

@freezed
class NoteDto with _$NoteDto {
  factory NoteDto({
    required int id,
    required String text,
    required List<ImageDto> images,
    required bool isRepostedOrQuoted,
    required bool canBeReposted,
    required bool isEdited,
    required UserDto creator,
    required DateTime creationDate,
    required bool isMyNote,
  }) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) => _$NoteDtoFromJson(json);
}