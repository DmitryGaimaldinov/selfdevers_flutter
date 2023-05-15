import 'package:json_annotation/json_annotation.dart';

part 'user_counter.g.dart';

@JsonSerializable()
class UserCounter {
  final int count;

  final UserCounterType counterType;

  const UserCounter({required this.counterType, required this.count});

  factory UserCounter.fromJson(Map<String, dynamic> json) => _$UserCounterFromJson(json);

  Map<String, dynamic> toJson() => _$UserCounterToJson(this);
}

@JsonEnum(alwaysCreate: true)
enum UserCounterType {
  followers,
  followings,
}