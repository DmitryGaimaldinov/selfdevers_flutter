// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comments_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetCommentsResultDto _$$_GetCommentsResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_GetCommentsResultDto(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => NoteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetCommentsResultDtoToJson(
        _$_GetCommentsResultDto instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };
