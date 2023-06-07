// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthResultDto _$AuthResultDtoFromJson(Map<String, dynamic> json) {
  return _AuthResultDto.fromJson(json);
}

/// @nodoc
mixin _$AuthResultDto {
  UserDto get user => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResultDtoCopyWith<AuthResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultDtoCopyWith<$Res> {
  factory $AuthResultDtoCopyWith(
          AuthResultDto value, $Res Function(AuthResultDto) then) =
      _$AuthResultDtoCopyWithImpl<$Res, AuthResultDto>;
  @useResult
  $Res call({UserDto user, String accessToken, String refreshToken});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthResultDtoCopyWithImpl<$Res, $Val extends AuthResultDto>
    implements $AuthResultDtoCopyWith<$Res> {
  _$AuthResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthResultDtoCopyWith<$Res>
    implements $AuthResultDtoCopyWith<$Res> {
  factory _$$_AuthResultDtoCopyWith(
          _$_AuthResultDto value, $Res Function(_$_AuthResultDto) then) =
      __$$_AuthResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDto user, String accessToken, String refreshToken});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AuthResultDtoCopyWithImpl<$Res>
    extends _$AuthResultDtoCopyWithImpl<$Res, _$_AuthResultDto>
    implements _$$_AuthResultDtoCopyWith<$Res> {
  __$$_AuthResultDtoCopyWithImpl(
      _$_AuthResultDto _value, $Res Function(_$_AuthResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_AuthResultDto(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthResultDto implements _AuthResultDto {
  _$_AuthResultDto(
      {required this.user,
      required this.accessToken,
      required this.refreshToken});

  factory _$_AuthResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_AuthResultDtoFromJson(json);

  @override
  final UserDto user;
  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthResultDto(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthResultDto &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthResultDtoCopyWith<_$_AuthResultDto> get copyWith =>
      __$$_AuthResultDtoCopyWithImpl<_$_AuthResultDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthResultDtoToJson(
      this,
    );
  }
}

abstract class _AuthResultDto implements AuthResultDto {
  factory _AuthResultDto(
      {required final UserDto user,
      required final String accessToken,
      required final String refreshToken}) = _$_AuthResultDto;

  factory _AuthResultDto.fromJson(Map<String, dynamic> json) =
      _$_AuthResultDto.fromJson;

  @override
  UserDto get user;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthResultDtoCopyWith<_$_AuthResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
