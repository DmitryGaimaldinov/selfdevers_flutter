// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_followings_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFollowingsResultDto _$GetFollowingsResultDtoFromJson(
    Map<String, dynamic> json) {
  return _GetFollowingsResultDto.fromJson(json);
}

/// @nodoc
mixin _$GetFollowingsResultDto {
  List<UserDto> get followings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFollowingsResultDtoCopyWith<GetFollowingsResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFollowingsResultDtoCopyWith<$Res> {
  factory $GetFollowingsResultDtoCopyWith(GetFollowingsResultDto value,
          $Res Function(GetFollowingsResultDto) then) =
      _$GetFollowingsResultDtoCopyWithImpl<$Res, GetFollowingsResultDto>;
  @useResult
  $Res call({List<UserDto> followings});
}

/// @nodoc
class _$GetFollowingsResultDtoCopyWithImpl<$Res,
        $Val extends GetFollowingsResultDto>
    implements $GetFollowingsResultDtoCopyWith<$Res> {
  _$GetFollowingsResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followings = null,
  }) {
    return _then(_value.copyWith(
      followings: null == followings
          ? _value.followings
          : followings // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetFollowingsResultDtoCopyWith<$Res>
    implements $GetFollowingsResultDtoCopyWith<$Res> {
  factory _$$_GetFollowingsResultDtoCopyWith(_$_GetFollowingsResultDto value,
          $Res Function(_$_GetFollowingsResultDto) then) =
      __$$_GetFollowingsResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDto> followings});
}

/// @nodoc
class __$$_GetFollowingsResultDtoCopyWithImpl<$Res>
    extends _$GetFollowingsResultDtoCopyWithImpl<$Res,
        _$_GetFollowingsResultDto>
    implements _$$_GetFollowingsResultDtoCopyWith<$Res> {
  __$$_GetFollowingsResultDtoCopyWithImpl(_$_GetFollowingsResultDto _value,
      $Res Function(_$_GetFollowingsResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followings = null,
  }) {
    return _then(_$_GetFollowingsResultDto(
      followings: null == followings
          ? _value._followings
          : followings // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFollowingsResultDto implements _GetFollowingsResultDto {
  _$_GetFollowingsResultDto({required final List<UserDto> followings})
      : _followings = followings;

  factory _$_GetFollowingsResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_GetFollowingsResultDtoFromJson(json);

  final List<UserDto> _followings;
  @override
  List<UserDto> get followings {
    if (_followings is EqualUnmodifiableListView) return _followings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followings);
  }

  @override
  String toString() {
    return 'GetFollowingsResultDto(followings: $followings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFollowingsResultDto &&
            const DeepCollectionEquality()
                .equals(other._followings, _followings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_followings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFollowingsResultDtoCopyWith<_$_GetFollowingsResultDto> get copyWith =>
      __$$_GetFollowingsResultDtoCopyWithImpl<_$_GetFollowingsResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetFollowingsResultDtoToJson(
      this,
    );
  }
}

abstract class _GetFollowingsResultDto implements GetFollowingsResultDto {
  factory _GetFollowingsResultDto({required final List<UserDto> followings}) =
      _$_GetFollowingsResultDto;

  factory _GetFollowingsResultDto.fromJson(Map<String, dynamic> json) =
      _$_GetFollowingsResultDto.fromJson;

  @override
  List<UserDto> get followings;
  @override
  @JsonKey(ignore: true)
  _$$_GetFollowingsResultDtoCopyWith<_$_GetFollowingsResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
