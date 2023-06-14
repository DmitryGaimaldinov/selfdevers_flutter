import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/profile/user.dart';

part 'get_followers_result_dto.freezed.dart';
part 'get_followers_result_dto.g.dart';

@freezed
class GetFollowersResultDto with _$GetFollowersResultDto {
  factory GetFollowersResultDto({
    required List<UserDto> followers
  }) = _GetFollowersResultDto;

  factory GetFollowersResultDto.fromJson(Map<String, dynamic> json) => _$GetFollowersResultDtoFromJson(json);
}