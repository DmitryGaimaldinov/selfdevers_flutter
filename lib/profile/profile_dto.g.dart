// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      relatedUserFields: RelatedUserFields.fromJson(
          json['relatedUserFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'relatedUserFields': instance.relatedUserFields,
    };
