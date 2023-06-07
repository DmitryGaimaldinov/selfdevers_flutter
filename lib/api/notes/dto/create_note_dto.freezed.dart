// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateNoteDto _$CreateNoteDtoFromJson(Map<String, dynamic> json) {
  return _CreateNoteDto.fromJson(json);
}

/// @nodoc
mixin _$CreateNoteDto {
  String get text => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  int? get quotedNoteId => throw _privateConstructorUsedError;
  List<int>? get imageIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNoteDtoCopyWith<CreateNoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoteDtoCopyWith<$Res> {
  factory $CreateNoteDtoCopyWith(
          CreateNoteDto value, $Res Function(CreateNoteDto) then) =
      _$CreateNoteDtoCopyWithImpl<$Res, CreateNoteDto>;
  @useResult
  $Res call(
      {String text, int? parentId, int? quotedNoteId, List<int>? imageIds});
}

/// @nodoc
class _$CreateNoteDtoCopyWithImpl<$Res, $Val extends CreateNoteDto>
    implements $CreateNoteDtoCopyWith<$Res> {
  _$CreateNoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? parentId = freezed,
    Object? quotedNoteId = freezed,
    Object? imageIds = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      quotedNoteId: freezed == quotedNoteId
          ? _value.quotedNoteId
          : quotedNoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageIds: freezed == imageIds
          ? _value.imageIds
          : imageIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNoteDtoCopyWith<$Res>
    implements $CreateNoteDtoCopyWith<$Res> {
  factory _$$_CreateNoteDtoCopyWith(
          _$_CreateNoteDto value, $Res Function(_$_CreateNoteDto) then) =
      __$$_CreateNoteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text, int? parentId, int? quotedNoteId, List<int>? imageIds});
}

/// @nodoc
class __$$_CreateNoteDtoCopyWithImpl<$Res>
    extends _$CreateNoteDtoCopyWithImpl<$Res, _$_CreateNoteDto>
    implements _$$_CreateNoteDtoCopyWith<$Res> {
  __$$_CreateNoteDtoCopyWithImpl(
      _$_CreateNoteDto _value, $Res Function(_$_CreateNoteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? parentId = freezed,
    Object? quotedNoteId = freezed,
    Object? imageIds = freezed,
  }) {
    return _then(_$_CreateNoteDto(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      quotedNoteId: freezed == quotedNoteId
          ? _value.quotedNoteId
          : quotedNoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageIds: freezed == imageIds
          ? _value._imageIds
          : imageIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateNoteDto implements _CreateNoteDto {
  _$_CreateNoteDto(
      {required this.text,
      required this.parentId,
      required this.quotedNoteId,
      required final List<int>? imageIds})
      : _imageIds = imageIds;

  factory _$_CreateNoteDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreateNoteDtoFromJson(json);

  @override
  final String text;
  @override
  final int? parentId;
  @override
  final int? quotedNoteId;
  final List<int>? _imageIds;
  @override
  List<int>? get imageIds {
    final value = _imageIds;
    if (value == null) return null;
    if (_imageIds is EqualUnmodifiableListView) return _imageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateNoteDto(text: $text, parentId: $parentId, quotedNoteId: $quotedNoteId, imageIds: $imageIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNoteDto &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.quotedNoteId, quotedNoteId) ||
                other.quotedNoteId == quotedNoteId) &&
            const DeepCollectionEquality().equals(other._imageIds, _imageIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, parentId, quotedNoteId,
      const DeepCollectionEquality().hash(_imageIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNoteDtoCopyWith<_$_CreateNoteDto> get copyWith =>
      __$$_CreateNoteDtoCopyWithImpl<_$_CreateNoteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateNoteDtoToJson(
      this,
    );
  }
}

abstract class _CreateNoteDto implements CreateNoteDto {
  factory _CreateNoteDto(
      {required final String text,
      required final int? parentId,
      required final int? quotedNoteId,
      required final List<int>? imageIds}) = _$_CreateNoteDto;

  factory _CreateNoteDto.fromJson(Map<String, dynamic> json) =
      _$_CreateNoteDto.fromJson;

  @override
  String get text;
  @override
  int? get parentId;
  @override
  int? get quotedNoteId;
  @override
  List<int>? get imageIds;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNoteDtoCopyWith<_$_CreateNoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
