// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_feed_people_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFeedPeopleResultDto _$GetFeedPeopleResultDtoFromJson(
    Map<String, dynamic> json) {
  return _GetFeedPeopleResultDto.fromJson(json);
}

/// @nodoc
mixin _$GetFeedPeopleResultDto {
  List<NoteDto> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedPeopleResultDtoCopyWith<GetFeedPeopleResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedPeopleResultDtoCopyWith<$Res> {
  factory $GetFeedPeopleResultDtoCopyWith(GetFeedPeopleResultDto value,
          $Res Function(GetFeedPeopleResultDto) then) =
      _$GetFeedPeopleResultDtoCopyWithImpl<$Res, GetFeedPeopleResultDto>;
  @useResult
  $Res call({List<NoteDto> notes});
}

/// @nodoc
class _$GetFeedPeopleResultDtoCopyWithImpl<$Res,
        $Val extends GetFeedPeopleResultDto>
    implements $GetFeedPeopleResultDtoCopyWith<$Res> {
  _$GetFeedPeopleResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetFeedPeopleResultDtoCopyWith<$Res>
    implements $GetFeedPeopleResultDtoCopyWith<$Res> {
  factory _$$_GetFeedPeopleResultDtoCopyWith(_$_GetFeedPeopleResultDto value,
          $Res Function(_$_GetFeedPeopleResultDto) then) =
      __$$_GetFeedPeopleResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NoteDto> notes});
}

/// @nodoc
class __$$_GetFeedPeopleResultDtoCopyWithImpl<$Res>
    extends _$GetFeedPeopleResultDtoCopyWithImpl<$Res,
        _$_GetFeedPeopleResultDto>
    implements _$$_GetFeedPeopleResultDtoCopyWith<$Res> {
  __$$_GetFeedPeopleResultDtoCopyWithImpl(_$_GetFeedPeopleResultDto _value,
      $Res Function(_$_GetFeedPeopleResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$_GetFeedPeopleResultDto(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFeedPeopleResultDto implements _GetFeedPeopleResultDto {
  _$_GetFeedPeopleResultDto({required final List<NoteDto> notes})
      : _notes = notes;

  factory _$_GetFeedPeopleResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_GetFeedPeopleResultDtoFromJson(json);

  final List<NoteDto> _notes;
  @override
  List<NoteDto> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'GetFeedPeopleResultDto(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFeedPeopleResultDto &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFeedPeopleResultDtoCopyWith<_$_GetFeedPeopleResultDto> get copyWith =>
      __$$_GetFeedPeopleResultDtoCopyWithImpl<_$_GetFeedPeopleResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetFeedPeopleResultDtoToJson(
      this,
    );
  }
}

abstract class _GetFeedPeopleResultDto implements GetFeedPeopleResultDto {
  factory _GetFeedPeopleResultDto({required final List<NoteDto> notes}) =
      _$_GetFeedPeopleResultDto;

  factory _GetFeedPeopleResultDto.fromJson(Map<String, dynamic> json) =
      _$_GetFeedPeopleResultDto.fromJson;

  @override
  List<NoteDto> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_GetFeedPeopleResultDtoCopyWith<_$_GetFeedPeopleResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
