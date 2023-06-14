// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_followers_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFollowersResultDto _$GetFollowersResultDtoFromJson(
    Map<String, dynamic> json) {
  return _GetFollowersResultDto.fromJson(json);
}

/// @nodoc
mixin _$GetFollowersResultDto {
  List<UserDto> get followers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFollowersResultDtoCopyWith<GetFollowersResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFollowersResultDtoCopyWith<$Res> {
  factory $GetFollowersResultDtoCopyWith(GetFollowersResultDto value,
          $Res Function(GetFollowersResultDto) then) =
      _$GetFollowersResultDtoCopyWithImpl<$Res, GetFollowersResultDto>;
  @useResult
  $Res call({List<UserDto> followers});
}

/// @nodoc
class _$GetFollowersResultDtoCopyWithImpl<$Res,
        $Val extends GetFollowersResultDto>
    implements $GetFollowersResultDtoCopyWith<$Res> {
  _$GetFollowersResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
  }) {
    return _then(_value.copyWith(
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetFollowersResultDtoCopyWith<$Res>
    implements $GetFollowersResultDtoCopyWith<$Res> {
  factory _$$_GetFollowersResultDtoCopyWith(_$_GetFollowersResultDto value,
          $Res Function(_$_GetFollowersResultDto) then) =
      __$$_GetFollowersResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDto> followers});
}

/// @nodoc
class __$$_GetFollowersResultDtoCopyWithImpl<$Res>
    extends _$GetFollowersResultDtoCopyWithImpl<$Res, _$_GetFollowersResultDto>
    implements _$$_GetFollowersResultDtoCopyWith<$Res> {
  __$$_GetFollowersResultDtoCopyWithImpl(_$_GetFollowersResultDto _value,
      $Res Function(_$_GetFollowersResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
  }) {
    return _then(_$_GetFollowersResultDto(
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFollowersResultDto implements _GetFollowersResultDto {
  _$_GetFollowersResultDto({required final List<UserDto> followers})
      : _followers = followers;

  factory _$_GetFollowersResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_GetFollowersResultDtoFromJson(json);

  final List<UserDto> _followers;
  @override
  List<UserDto> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  @override
  String toString() {
    return 'GetFollowersResultDto(followers: $followers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFollowersResultDto &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_followers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFollowersResultDtoCopyWith<_$_GetFollowersResultDto> get copyWith =>
      __$$_GetFollowersResultDtoCopyWithImpl<_$_GetFollowersResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetFollowersResultDtoToJson(
      this,
    );
  }
}

abstract class _GetFollowersResultDto implements GetFollowersResultDto {
  factory _GetFollowersResultDto({required final List<UserDto> followers}) =
      _$_GetFollowersResultDto;

  factory _GetFollowersResultDto.fromJson(Map<String, dynamic> json) =
      _$_GetFollowersResultDto.fromJson;

  @override
  List<UserDto> get followers;
  @override
  @JsonKey(ignore: true)
  _$$_GetFollowersResultDtoCopyWith<_$_GetFollowersResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
