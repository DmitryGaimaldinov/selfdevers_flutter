// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_notes_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUserNotesResultDto _$GetUserNotesResultDtoFromJson(
    Map<String, dynamic> json) {
  return _GetUserNotesResultDto.fromJson(json);
}

/// @nodoc
mixin _$GetUserNotesResultDto {
  List<NoteDto> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserNotesResultDtoCopyWith<GetUserNotesResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserNotesResultDtoCopyWith<$Res> {
  factory $GetUserNotesResultDtoCopyWith(GetUserNotesResultDto value,
          $Res Function(GetUserNotesResultDto) then) =
      _$GetUserNotesResultDtoCopyWithImpl<$Res, GetUserNotesResultDto>;
  @useResult
  $Res call({List<NoteDto> notes});
}

/// @nodoc
class _$GetUserNotesResultDtoCopyWithImpl<$Res,
        $Val extends GetUserNotesResultDto>
    implements $GetUserNotesResultDtoCopyWith<$Res> {
  _$GetUserNotesResultDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_GetUserNotesResultDtoCopyWith<$Res>
    implements $GetUserNotesResultDtoCopyWith<$Res> {
  factory _$$_GetUserNotesResultDtoCopyWith(_$_GetUserNotesResultDto value,
          $Res Function(_$_GetUserNotesResultDto) then) =
      __$$_GetUserNotesResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NoteDto> notes});
}

/// @nodoc
class __$$_GetUserNotesResultDtoCopyWithImpl<$Res>
    extends _$GetUserNotesResultDtoCopyWithImpl<$Res, _$_GetUserNotesResultDto>
    implements _$$_GetUserNotesResultDtoCopyWith<$Res> {
  __$$_GetUserNotesResultDtoCopyWithImpl(_$_GetUserNotesResultDto _value,
      $Res Function(_$_GetUserNotesResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$_GetUserNotesResultDto(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetUserNotesResultDto implements _GetUserNotesResultDto {
  _$_GetUserNotesResultDto({required final List<NoteDto> notes})
      : _notes = notes;

  factory _$_GetUserNotesResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_GetUserNotesResultDtoFromJson(json);

  final List<NoteDto> _notes;
  @override
  List<NoteDto> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'GetUserNotesResultDto(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserNotesResultDto &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserNotesResultDtoCopyWith<_$_GetUserNotesResultDto> get copyWith =>
      __$$_GetUserNotesResultDtoCopyWithImpl<_$_GetUserNotesResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetUserNotesResultDtoToJson(
      this,
    );
  }
}

abstract class _GetUserNotesResultDto implements GetUserNotesResultDto {
  factory _GetUserNotesResultDto({required final List<NoteDto> notes}) =
      _$_GetUserNotesResultDto;

  factory _GetUserNotesResultDto.fromJson(Map<String, dynamic> json) =
      _$_GetUserNotesResultDto.fromJson;

  @override
  List<NoteDto> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserNotesResultDtoCopyWith<_$_GetUserNotesResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
