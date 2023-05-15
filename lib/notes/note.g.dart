// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      json['id'] as int,
      json['text'] as String,
      User.fromJson(json['creator'] as Map<String, dynamic>),
      json['isEdited'] as bool,
      DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'creator': instance.creator,
      'isEdited': instance.isEdited,
      'creationDate': instance.creationDate.toIso8601String(),
    };
