import 'package:json_annotation/json_annotation.dart';
import 'package:selfdevers/profile/user_counter.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, )
class User {
  int id;

  String name;

  String userTag;

  String description;

  String registerDate;

  String? avatarUrl;

  String? backgroundUrl;

  bool isPrivate;

  Map<UserCounterType, int>? counters;

  User({
    required this.id,
    required this.name,
    required this.userTag,
    required this.description,
    required this.registerDate,
    required this.avatarUrl,
    required this.backgroundUrl,
    required this.isPrivate,
    this.counters,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
