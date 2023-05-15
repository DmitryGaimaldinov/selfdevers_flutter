// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_user_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedUserFields _$RelatedUserFieldsFromJson(Map<String, dynamic> json) =>
    RelatedUserFields(
      followState: $enumDecode(_$FollowStateEnumMap, json['followState']),
      hasAccessState:
          $enumDecode(_$HasAccessToUserStateEnumMap, json['hasAccessState']),
    );

Map<String, dynamic> _$RelatedUserFieldsToJson(RelatedUserFields instance) =>
    <String, dynamic>{
      'followState': _$FollowStateEnumMap[instance.followState]!,
      'hasAccessState': _$HasAccessToUserStateEnumMap[instance.hasAccessState]!,
    };

const _$FollowStateEnumMap = {
  FollowState.isMe: 'isMe',
  FollowState.notFollowing: 'notFollowing',
  FollowState.requestSent: 'requestSent',
  FollowState.following: 'following',
};

const _$HasAccessToUserStateEnumMap = {
  HasAccessToUserState.hasAccess: 'hasAccess',
  HasAccessToUserState.profileIsPrivate: 'profileIsPrivate',
};
