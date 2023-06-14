// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_notes_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchNotesResultDto _$SearchNotesResultDtoFromJson(Map<String, dynamic> json) {
  return _SearchNotesResultDto.fromJson(json);
}

/// @nodoc
mixin _$SearchNotesResultDto {
  List<NoteDto> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchNotesResultDtoCopyWith<SearchNotesResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchNotesResultDtoCopyWith<$Res> {
  factory $SearchNotesResultDtoCopyWith(SearchNotesResultDto value,
          $Res Function(SearchNotesResultDto) then) =
      _$SearchNotesResultDtoCopyWithImpl<$Res, SearchNotesResultDto>;
  @useResult
  $Res call({List<NoteDto> notes});
}

/// @nodoc
class _$SearchNotesResultDtoCopyWithImpl<$Res,
        $Val extends SearchNotesResultDto>
    implements $SearchNotesResultDtoCopyWith<$Res> {
  _$SearchNotesResultDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_SearchNotesResultDtoCopyWith<$Res>
    implements $SearchNotesResultDtoCopyWith<$Res> {
  factory _$$_SearchNotesResultDtoCopyWith(_$_SearchNotesResultDto value,
          $Res Function(_$_SearchNotesResultDto) then) =
      __$$_SearchNotesResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NoteDto> notes});
}

/// @nodoc
class __$$_SearchNotesResultDtoCopyWithImpl<$Res>
    extends _$SearchNotesResultDtoCopyWithImpl<$Res, _$_SearchNotesResultDto>
    implements _$$_SearchNotesResultDtoCopyWith<$Res> {
  __$$_SearchNotesResultDtoCopyWithImpl(_$_SearchNotesResultDto _value,
      $Res Function(_$_SearchNotesResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$_SearchNotesResultDto(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchNotesResultDto implements _SearchNotesResultDto {
  _$_SearchNotesResultDto({required final List<NoteDto> notes})
      : _notes = notes;

  factory _$_SearchNotesResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_SearchNotesResultDtoFromJson(json);

  final List<NoteDto> _notes;
  @override
  List<NoteDto> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'SearchNotesResultDto(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchNotesResultDto &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchNotesResultDtoCopyWith<_$_SearchNotesResultDto> get copyWith =>
      __$$_SearchNotesResultDtoCopyWithImpl<_$_SearchNotesResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchNotesResultDtoToJson(
      this,
    );
  }
}

abstract class _SearchNotesResultDto implements SearchNotesResultDto {
  factory _SearchNotesResultDto({required final List<NoteDto> notes}) =
      _$_SearchNotesResultDto;

  factory _SearchNotesResultDto.fromJson(Map<String, dynamic> json) =
      _$_SearchNotesResultDto.fromJson;

  @override
  List<NoteDto> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_SearchNotesResultDtoCopyWith<_$_SearchNotesResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
