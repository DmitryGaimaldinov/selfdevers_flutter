import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum FollowStateDto {
  notFollowing,
  requestSent,
  following,
}