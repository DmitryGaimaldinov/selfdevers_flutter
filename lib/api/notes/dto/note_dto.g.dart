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
      isQuoted: json['isQuoted'] as bool,
      isEdited: json['isEdited'] as bool,
      creator: UserDto.fromJson(json['creator'] as Map<String, dynamic>),
      creationDate: DateTime.parse(json['creationDate'] as String),
      isMyNote: json['isMyNote'] as bool,
      likeCount: json['likeCount'] as int,
      isLikedByMe: json['isLikedByMe'] as bool,
      quoteCount: json['quoteCount'] as int,
      quotedNoteDto: json['quotedNoteDto'] == null
          ? null
          : NoteDto.fromJson(json['quotedNoteDto'] as Map<String, dynamic>),
      commentCount: json['commentCount'] as int,
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'images': instance.images,
      'isQuoted': instance.isQuoted,
      'isEdited': instance.isEdited,
      'creator': instance.creator,
      'creationDate': instance.creationDate.toIso8601String(),
      'isMyNote': instance.isMyNote,
      'likeCount': instance.likeCount,
      'isLikedByMe': instance.isLikedByMe,
      'quoteCount': instance.quoteCount,
      'quotedNoteDto': instance.quotedNoteDto,
      'commentCount': instance.commentCount,
    };
