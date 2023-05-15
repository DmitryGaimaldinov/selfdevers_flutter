import 'package:json_annotation/json_annotation.dart';
import 'package:selfdevers/profile/related_user_fields.dart';

import 'user.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDto {
  User user;

  RelatedUserFields relatedUserFields;

  ProfileDto({
    required this.user,
    required this.relatedUserFields,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}