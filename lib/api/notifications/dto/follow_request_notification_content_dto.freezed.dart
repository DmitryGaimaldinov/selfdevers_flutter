// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_request_notification_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowRequestNotificationContentDto
    _$FollowRequestNotificationContentDtoFromJson(Map<String, dynamic> json) {
  return _FollowRequestNotificationContentDto.fromJson(json);
}

/// @nodoc
mixin _$FollowRequestNotificationContentDto {
  UserDto get follower => throw _privateConstructorUsedError;
  NotificationType get notificationType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowRequestNotificationContentDtoCopyWith<
          FollowRequestNotificationContentDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowRequestNotificationContentDtoCopyWith<$Res> {
  factory $FollowRequestNotificationContentDtoCopyWith(
          FollowRequestNotificationContentDto value,
          $Res Function(FollowRequestNotificationContentDto) then) =
      _$FollowRequestNotificationContentDtoCopyWithImpl<$Res,
          FollowRequestNotificationContentDto>;
  @useResult
  $Res call({UserDto follower, NotificationType notificationType});

  $UserDtoCopyWith<$Res> get follower;
}

/// @nodoc
class _$FollowRequestNotificationContentDtoCopyWithImpl<$Res,
        $Val extends FollowRequestNotificationContentDto>
    implements $FollowRequestNotificationContentDtoCopyWith<$Res> {
  _$FollowRequestNotificationContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? follower = null,
    Object? notificationType = null,
  }) {
    return _then(_value.copyWith(
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as UserDto,
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as NotificationType,
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
abstract class _$$_FollowRequestNotificationContentDtoCopyWith<$Res>
    implements $FollowRequestNotificationContentDtoCopyWith<$Res> {
  factory _$$_FollowRequestNotificationContentDtoCopyWith(
          _$_FollowRequestNotificationContentDto value,
          $Res Function(_$_FollowRequestNotificationContentDto) then) =
      __$$_FollowRequestNotificationContentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDto follower, NotificationType notificationType});

  @override
  $UserDtoCopyWith<$Res> get follower;
}

/// @nodoc
class __$$_FollowRequestNotificationContentDtoCopyWithImpl<$Res>
    extends _$FollowRequestNotificationContentDtoCopyWithImpl<$Res,
        _$_FollowRequestNotificationContentDto>
    implements _$$_FollowRequestNotificationContentDtoCopyWith<$Res> {
  __$$_FollowRequestNotificationContentDtoCopyWithImpl(
      _$_FollowRequestNotificationContentDto _value,
      $Res Function(_$_FollowRequestNotificationContentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? follower = null,
    Object? notificationType = null,
  }) {
    return _then(_$_FollowRequestNotificationContentDto(
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as UserDto,
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FollowRequestNotificationContentDto
    implements _FollowRequestNotificationContentDto {
  _$_FollowRequestNotificationContentDto(
      {required this.follower, required this.notificationType});

  factory _$_FollowRequestNotificationContentDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_FollowRequestNotificationContentDtoFromJson(json);

  @override
  final UserDto follower;
  @override
  final NotificationType notificationType;

  @override
  String toString() {
    return 'FollowRequestNotificationContentDto(follower: $follower, notificationType: $notificationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowRequestNotificationContentDto &&
            (identical(other.follower, follower) ||
                other.follower == follower) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, follower, notificationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowRequestNotificationContentDtoCopyWith<
          _$_FollowRequestNotificationContentDto>
      get copyWith => __$$_FollowRequestNotificationContentDtoCopyWithImpl<
          _$_FollowRequestNotificationContentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowRequestNotificationContentDtoToJson(
      this,
    );
  }
}

abstract class _FollowRequestNotificationContentDto
    implements FollowRequestNotificationContentDto {
  factory _FollowRequestNotificationContentDto(
          {required final UserDto follower,
          required final NotificationType notificationType}) =
      _$_FollowRequestNotificationContentDto;

  factory _FollowRequestNotificationContentDto.fromJson(
          Map<String, dynamic> json) =
      _$_FollowRequestNotificationContentDto.fromJson;

  @override
  UserDto get follower;
  @override
  NotificationType get notificationType;
  @override
  @JsonKey(ignore: true)
  _$$_FollowRequestNotificationContentDtoCopyWith<
          _$_FollowRequestNotificationContentDto>
      get copyWith => throw _privateConstructorUsedError;
}
