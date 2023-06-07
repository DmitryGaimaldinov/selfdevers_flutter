// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notifications_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetNotificationsResultDto _$GetNotificationsResultDtoFromJson(
    Map<String, dynamic> json) {
  return _GetNotificationsResultDto.fromJson(json);
}

/// @nodoc
mixin _$GetNotificationsResultDto {
  DateTime? get lastViewed => throw _privateConstructorUsedError;
  List<NotificationDto> get notifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotificationsResultDtoCopyWith<GetNotificationsResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationsResultDtoCopyWith<$Res> {
  factory $GetNotificationsResultDtoCopyWith(GetNotificationsResultDto value,
          $Res Function(GetNotificationsResultDto) then) =
      _$GetNotificationsResultDtoCopyWithImpl<$Res, GetNotificationsResultDto>;
  @useResult
  $Res call({DateTime? lastViewed, List<NotificationDto> notifications});
}

/// @nodoc
class _$GetNotificationsResultDtoCopyWithImpl<$Res,
        $Val extends GetNotificationsResultDto>
    implements $GetNotificationsResultDtoCopyWith<$Res> {
  _$GetNotificationsResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastViewed = freezed,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      lastViewed: freezed == lastViewed
          ? _value.lastViewed
          : lastViewed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetNotificationsResultDtoCopyWith<$Res>
    implements $GetNotificationsResultDtoCopyWith<$Res> {
  factory _$$_GetNotificationsResultDtoCopyWith(
          _$_GetNotificationsResultDto value,
          $Res Function(_$_GetNotificationsResultDto) then) =
      __$$_GetNotificationsResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? lastViewed, List<NotificationDto> notifications});
}

/// @nodoc
class __$$_GetNotificationsResultDtoCopyWithImpl<$Res>
    extends _$GetNotificationsResultDtoCopyWithImpl<$Res,
        _$_GetNotificationsResultDto>
    implements _$$_GetNotificationsResultDtoCopyWith<$Res> {
  __$$_GetNotificationsResultDtoCopyWithImpl(
      _$_GetNotificationsResultDto _value,
      $Res Function(_$_GetNotificationsResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastViewed = freezed,
    Object? notifications = null,
  }) {
    return _then(_$_GetNotificationsResultDto(
      lastViewed: freezed == lastViewed
          ? _value.lastViewed
          : lastViewed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetNotificationsResultDto implements _GetNotificationsResultDto {
  _$_GetNotificationsResultDto(
      {required this.lastViewed,
      required final List<NotificationDto> notifications})
      : _notifications = notifications;

  factory _$_GetNotificationsResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_GetNotificationsResultDtoFromJson(json);

  @override
  final DateTime? lastViewed;
  final List<NotificationDto> _notifications;
  @override
  List<NotificationDto> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'GetNotificationsResultDto(lastViewed: $lastViewed, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetNotificationsResultDto &&
            (identical(other.lastViewed, lastViewed) ||
                other.lastViewed == lastViewed) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastViewed,
      const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetNotificationsResultDtoCopyWith<_$_GetNotificationsResultDto>
      get copyWith => __$$_GetNotificationsResultDtoCopyWithImpl<
          _$_GetNotificationsResultDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetNotificationsResultDtoToJson(
      this,
    );
  }
}

abstract class _GetNotificationsResultDto implements GetNotificationsResultDto {
  factory _GetNotificationsResultDto(
          {required final DateTime? lastViewed,
          required final List<NotificationDto> notifications}) =
      _$_GetNotificationsResultDto;

  factory _GetNotificationsResultDto.fromJson(Map<String, dynamic> json) =
      _$_GetNotificationsResultDto.fromJson;

  @override
  DateTime? get lastViewed;
  @override
  List<NotificationDto> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_GetNotificationsResultDtoCopyWith<_$_GetNotificationsResultDto>
      get copyWith => throw _privateConstructorUsedError;
}
