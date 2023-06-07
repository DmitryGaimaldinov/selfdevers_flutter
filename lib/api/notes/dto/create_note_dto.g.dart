// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateNoteDto _$$_CreateNoteDtoFromJson(Map<String, dynamic> json) =>
    _$_CreateNoteDto(
      text: json['text'] as String,
      parentId: json['parentId'] as int?,
      quotedNoteId: json['quotedNoteId'] as int?,
      imageIds:
          (json['imageIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_CreateNoteDtoToJson(_$_CreateNoteDto instance) =>
    <String, dynamic>{
      'text': instance.text,
      'parentId': instance.parentId,
      'quotedNoteId': instance.quotedNoteId,
      'imageIds': instance.imageIds,
    };
