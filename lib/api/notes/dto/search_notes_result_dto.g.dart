// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_notes_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchNotesResultDto _$$_SearchNotesResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SearchNotesResultDto(
      notes: (json['notes'] as List<dynamic>)
          .map((e) => NoteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchNotesResultDtoToJson(
        _$_SearchNotesResultDto instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
