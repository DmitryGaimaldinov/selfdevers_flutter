import 'package:json_annotation/json_annotation.dart';
import 'package:selfdevers/profile/user.dart';

part 'get_followings_result.g.dart';

@JsonSerializable()
class GetFollowingsResult {
  final List<User> followedUsers;

  DateTime? beforeDate;

  GetFollowingsResult({
    required this.followedUsers,
    this.beforeDate,
  });

  factory GetFollowingsResult.fromJson(Map<String, dynamic> json) => _$GetFollowingsResultFromJson(json);

  Map<String, dynamic> toJson() => _$GetFollowingsResultToJson(this);
}