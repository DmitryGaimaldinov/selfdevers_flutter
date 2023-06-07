// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDto _$$_NoteDtoFromJson(Map<String, dynamic> json) => _$_NoteDto(
      id: json['id'] as int,
      text: json['text'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRepostedOrQuoted: json['isRepostedOrQuoted'] as bool,
      canBeReposted: json['canBeReposted'] as bool,
      isEdited: json['isEdited'] as bool,
      creator: UserDto.fromJson(json['creator'] as Map<String, dynamic>),
      creationDate: DateTime.parse(json['creationDate'] as String),
      isMyNote: json['isMyNote'] as bool,
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'images': instance.images,
      'isRepostedOrQuoted': instance.isRepostedOrQuoted,
      'canBeReposted': instance.canBeReposted,
      'isEdited': instance.isEdited,
      'creator': instance.creator,
      'creationDate': instance.creationDate.toIso8601String(),
      'isMyNote': instance.isMyNote,
    };
