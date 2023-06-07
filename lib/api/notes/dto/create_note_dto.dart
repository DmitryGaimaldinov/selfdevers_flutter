import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_note_dto.freezed.dart';
part 'create_note_dto.g.dart';

@freezed
class CreateNoteDto with _$CreateNoteDto {
  factory CreateNoteDto({
    required String text,
    required int? parentId,
    required int? quotedNoteId,
    required List<int>? imageIds,
  }) = _CreateNoteDto;

  factory CreateNoteDto.fromJson(Map<String, dynamic> json) => _$CreateNoteDtoFromJson(json);
}