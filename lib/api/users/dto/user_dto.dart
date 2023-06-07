import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';

import '../../followings/dto/follow_state_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  factory UserDto({
    required int id,
    required String name,
    required String userTag,
    required String description,
    required DateTime registerDate,
    ImageDto? avatar,
    ImageDto? background,
    required bool isPrivate,
    required UserCountersDto counters,
    required bool isMe,
    required FollowStateDto followState,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}

@freezed
class UserCountersDto with _$UserCountersDto {
  factory UserCountersDto({
    required int followersCount,
    required int followingsCount,
    required int notesCount,
  }) = _UserCountersDto;

  factory UserCountersDto.fromJson(Map<String, dynamic> json) => _$UserCountersDtoFromJson(json);
}


