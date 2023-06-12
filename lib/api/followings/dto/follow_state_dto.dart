import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_state_dto.g.dart';

@JsonEnum(alwaysCreate: true)
enum FollowStateDto {
  notFollowing,
  requestSent,
  following,
}