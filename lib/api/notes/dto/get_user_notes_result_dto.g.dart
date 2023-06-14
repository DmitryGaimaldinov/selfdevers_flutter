// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_notes_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetUserNotesResultDto _$$_GetUserNotesResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_GetUserNotesResultDto(
      notes: (json['notes'] as List<dynamic>)
          .map((e) => NoteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetUserNotesResultDtoToJson(
        _$_GetUserNotesResultDto instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
