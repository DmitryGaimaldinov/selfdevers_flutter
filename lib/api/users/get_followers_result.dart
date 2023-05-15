import 'package:json_annotation/json_annotation.dart';
import 'package:selfdevers/profile/user.dart';

part 'get_followers_result.g.dart';

@JsonSerializable()
class GetFollowersResult {
  final List<User> followers;

  DateTime? beforeDate;

  GetFollowersResult({
    required this.followers,
    this.beforeDate,
  });

  factory GetFollowersResult.fromJson(Map<String, dynamic> json) => _$GetFollowersResultFromJson(json);

  Map<String, dynamic> toJson() => _$GetFollowersResultToJson(this);
}