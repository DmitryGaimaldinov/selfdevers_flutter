// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed_people_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFeedPeopleResultDto _$$_GetFeedPeopleResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_GetFeedPeopleResultDto(
      notes: (json['notes'] as List<dynamic>)
          .map((e) => NoteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetFeedPeopleResultDtoToJson(
        _$_GetFeedPeopleResultDto instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
