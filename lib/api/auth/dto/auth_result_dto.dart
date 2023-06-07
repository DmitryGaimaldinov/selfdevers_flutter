import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';

part 'auth_result_dto.freezed.dart';
part 'auth_result_dto.g.dart';

@freezed
class AuthResultDto with _$AuthResultDto {
  factory AuthResultDto({
    required UserDto user,
    required String accessToken,
    required String refreshToken,
  }) = _AuthResultDto;

  factory AuthResultDto.fromJson(Map<String, dynamic> json) => _$AuthResultDtoFromJson(json);
}