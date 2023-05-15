import 'package:json_annotation/json_annotation.dart';

import '../profile/user.dart';

part 'auth_result_dto.g.dart';

@JsonSerializable()
class AuthResultDto {

  final User user;

  final String accessToken;

  final String refreshToken;

  AuthResultDto({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResultDto.fromJson(Map<String, dynamic> json) => _$AuthResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultDtoToJson(this);
}