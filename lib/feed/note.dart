import 'package:json_annotation/json_annotation.dart';

import '../profile/user.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {

  int id;

  String text;

  User creator;

  bool isEdited;

  DateTime creationDate;

  Note(this.id, this.text, this.creator, this.isEdited, this.creationDate);

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}