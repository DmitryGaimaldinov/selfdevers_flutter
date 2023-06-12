// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) {
  return _NotificationDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationDto {
  int get id => throw _privateConstructorUsedError;
  DateTime get date =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: NotificationDto.mapContent)
  NotificationContentDto get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDtoCopyWith<NotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDtoCopyWith<$Res> {
  factory $NotificationDtoCopyWith(
          NotificationDto value, $Res Function(NotificationDto) then) =
      _$NotificationDtoCopyWithImpl<$Res, NotificationDto>;
  @useResult
  $Res call(
      {int id,
      DateTime date,
      @JsonKey(fromJson: NotificationDto.mapContent)
          NotificationContentDto content});
}

/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res, $Val extends NotificationDto>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NotificationContentDto,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationDtoCopyWith<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  factory _$$_NotificationDtoCopyWith(
          _$_NotificationDto value, $Res Function(_$_NotificationDto) then) =
      __$$_NotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime date,
      @JsonKey(fromJson: NotificationDto.mapContent)
          NotificationContentDto content});
}

/// @nodoc
class __$$_NotificationDtoCopyWithImpl<$Res>
    extends _$NotificationDtoCopyWithImpl<$Res, _$_NotificationDto>
    implements _$$_NotificationDtoCopyWith<$Res> {
  __$$_NotificationDtoCopyWithImpl(
      _$_NotificationDto _value, $Res Function(_$_NotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? content = null,
  }) {
    return _then(_$_NotificationDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NotificationContentDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationDto implements _NotificationDto {
  _$_NotificationDto(
      {required this.id,
      required this.date,
      @JsonKey(fromJson: NotificationDto.mapContent) required this.content});

  factory _$_NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDtoFromJson(json);

  @override
  final int id;
  @override
  final DateTime date;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: NotificationDto.mapContent)
  final NotificationContentDto content;

  @override
  String toString() {
    return 'NotificationDto(id: $id, date: $date, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationDtoCopyWith<_$_NotificationDto> get copyWith =>
      __$$_NotificationDtoCopyWithImpl<_$_NotificationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDtoToJson(
      this,
    );
  }
}

abstract class _NotificationDto implements NotificationDto {
  factory _NotificationDto(
      {required final int id,
      required final DateTime date,
      @JsonKey(fromJson: NotificationDto.mapContent)
          required final NotificationContentDto content}) = _$_NotificationDto;

  factory _NotificationDto.fromJson(Map<String, dynamic> json) =
      _$_NotificationDto.fromJson;

  @override
  int get id;
  @override
  DateTime get date;
  @override // ignore: invalid_annotation_target
  @JsonKey(fromJson: NotificationDto.mapContent)
  NotificationContentDto get content;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDtoCopyWith<_$_NotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
