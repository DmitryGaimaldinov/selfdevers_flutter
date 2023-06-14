import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'send_note_dto.freezed.dart';

@freezed
class SendNoteDto with _$SendNoteDto {
  factory SendNoteDto({
    required String text,
    required List<XFile> imageXFiles,
    required int? quotedNoteId,
    required int? parentNoteId,
  }) = _SendNoteDto;
}
