import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/profile/user.dart';

part 'get_followings_result_dto.freezed.dart';
part 'get_followings_result_dto.g.dart';

@freezed
class GetFollowingsResultDto with _$GetFollowingsResultDto {
  factory GetFollowingsResultDto({
    required List<UserDto> followings
  }) = _GetFollowingsResultDto;

  factory GetFollowingsResultDto.fromJson(Map<String, dynamic> json) => _$GetFollowingsResultDtoFromJson(json);
}