// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_notification_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowNotificationContentDto _$FollowNotificationContentDtoFromJson(
    Map<String, dynamic> json) {
  return _FollowNotificationContentDto.fromJson(json);
}

/// @nodoc
mixin _$FollowNotificationContentDto {
  NotificationType get notificationType => throw _privateConstructorUsedError;
  UserDto get follower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowNotificationContentDtoCopyWith<FollowNotificationContentDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowNotificationContentDtoCopyWith<$Res> {
  factory $FollowNotificationContentDtoCopyWith(
          FollowNotificationContentDto value,
          $Res Function(FollowNotificationContentDto) then) =
      _$FollowNotificationContentDtoCopyWithImpl<$Res,
          FollowNotificationContentDto>;
  @useResult
  $Res call({NotificationType notificationType, UserDto follower});

  $UserDtoCopyWith<$Res> get follower;
}

/// @nodoc
class _$FollowNotificationContentDtoCopyWithImpl<$Res,
        $Val extends FollowNotificationContentDto>
    implements $FollowNotificationContentDtoCopyWith<$Res> {
  _$FollowNotificationContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? follower = null,
  }) {
    return _then(_value.copyWith(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get follower {
    return $UserDtoCopyWith<$Res>(_value.follower, (value) {
      return _then(_value.copyWith(follower: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FollowNotificationContentDtoCopyWith<$Res>
    implements $FollowNotificationContentDtoCopyWith<$Res> {
  factory _$$_FollowNotificationContentDtoCopyWith(
          _$_FollowNotificationContentDto value,
          $Res Function(_$_FollowNotificationContentDto) then) =
      __$$_FollowNotificationContentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationType notificationType, UserDto follower});

  @override
  $UserDtoCopyWith<$Res> get follower;
}

/// @nodoc
class __$$_FollowNotificationContentDtoCopyWithImpl<$Res>
    extends _$FollowNotificationContentDtoCopyWithImpl<$Res,
        _$_FollowNotificationContentDto>
    implements _$$_FollowNotificationContentDtoCopyWith<$Res> {
  __$$_FollowNotificationContentDtoCopyWithImpl(
      _$_FollowNotificationContentDto _value,
      $Res Function(_$_FollowNotificationContentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? follower = null,
  }) {
    return _then(_$_FollowNotificationContentDto(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FollowNotificationContentDto implements _FollowNotificationContentDto {
  _$_FollowNotificationContentDto(
      {required this.notificationType, required this.follower});

  factory _$_FollowNotificationContentDto.fromJson(Map<String, dynamic> json) =>
      _$$_FollowNotificationContentDtoFromJson(json);

  @override
  final NotificationType notificationType;
  @override
  final UserDto follower;

  @override
  String toString() {
    return 'FollowNotificationContentDto(notificationType: $notificationType, follower: $follower)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowNotificationContentDto &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.follower, follower) ||
                other.follower == follower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationType, follower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowNotificationContentDtoCopyWith<_$_FollowNotificationContentDto>
      get copyWith => __$$_FollowNotificationContentDtoCopyWithImpl<
          _$_FollowNotificationContentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowNotificationContentDtoToJson(
      this,
    );
  }
}

abstract class _FollowNotificationContentDto
    implements FollowNotificationContentDto {
  factory _FollowNotificationContentDto(
      {required final NotificationType notificationType,
      required final UserDto follower}) = _$_FollowNotificationContentDto;

  factory _FollowNotificationContentDto.fromJson(Map<String, dynamic> json) =
      _$_FollowNotificationContentDto.fromJson;

  @override
  NotificationType get notificationType;
  @override
  UserDto get follower;
  @override
  @JsonKey(ignore: true)
  _$$_FollowNotificationContentDtoCopyWith<_$_FollowNotificationContentDto>
      get copyWith => throw _privateConstructorUsedError;
}
