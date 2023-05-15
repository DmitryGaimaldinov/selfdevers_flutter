import 'package:json_annotation/json_annotation.dart';

part 'related_user_fields.g.dart';

@JsonSerializable()
class RelatedUserFields {
  final FollowState followState;

  final HasAccessToUserState hasAccessState;

  RelatedUserFields({
    required this.followState,
    required this.hasAccessState,
  });

  factory RelatedUserFields.fromJson(Map<String, dynamic> json) => _$RelatedUserFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedUserFieldsToJson(this);
}

@JsonEnum(alwaysCreate: true)
enum FollowState {
  isMe,
  notFollowing,
  requestSent,
  following,
}

@JsonEnum(alwaysCreate: true)
enum HasAccessToUserState {
  hasAccess,
  profileIsPrivate,
}