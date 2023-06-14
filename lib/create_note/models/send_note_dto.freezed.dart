// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendNoteDto {
  String get text => throw _privateConstructorUsedError;
  List<XFile> get imageXFiles => throw _privateConstructorUsedError;
  int? get quotedNoteId => throw _privateConstructorUsedError;
  int? get parentNoteId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendNoteDtoCopyWith<SendNoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendNoteDtoCopyWith<$Res> {
  factory $SendNoteDtoCopyWith(
          SendNoteDto value, $Res Function(SendNoteDto) then) =
      _$SendNoteDtoCopyWithImpl<$Res, SendNoteDto>;
  @useResult
  $Res call(
      {String text,
      List<XFile> imageXFiles,
      int? quotedNoteId,
      int? parentNoteId});
}

/// @nodoc
class _$SendNoteDtoCopyWithImpl<$Res, $Val extends SendNoteDto>
    implements $SendNoteDtoCopyWith<$Res> {
  _$SendNoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? imageXFiles = null,
    Object? quotedNoteId = freezed,
    Object? parentNoteId = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageXFiles: null == imageXFiles
          ? _value.imageXFiles
          : imageXFiles // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      quotedNoteId: freezed == quotedNoteId
          ? _value.quotedNoteId
          : quotedNoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentNoteId: freezed == parentNoteId
          ? _value.parentNoteId
          : parentNoteId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendNoteDtoCopyWith<$Res>
    implements $SendNoteDtoCopyWith<$Res> {
  factory _$$_SendNoteDtoCopyWith(
          _$_SendNoteDto value, $Res Function(_$_SendNoteDto) then) =
      __$$_SendNoteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      List<XFile> imageXFiles,
      int? quotedNoteId,
      int? parentNoteId});
}

/// @nodoc
class __$$_SendNoteDtoCopyWithImpl<$Res>
    extends _$SendNoteDtoCopyWithImpl<$Res, _$_SendNoteDto>
    implements _$$_SendNoteDtoCopyWith<$Res> {
  __$$_SendNoteDtoCopyWithImpl(
      _$_SendNoteDto _value, $Res Function(_$_SendNoteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? imageXFiles = null,
    Object? quotedNoteId = freezed,
    Object? parentNoteId = freezed,
  }) {
    return _then(_$_SendNoteDto(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageXFiles: null == imageXFiles
          ? _value._imageXFiles
          : imageXFiles // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      quotedNoteId: freezed == quotedNoteId
          ? _value.quotedNoteId
          : quotedNoteId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentNoteId: freezed == parentNoteId
          ? _value.parentNoteId
          : parentNoteId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SendNoteDto implements _SendNoteDto {
  _$_SendNoteDto(
      {required this.text,
      required final List<XFile> imageXFiles,
      required this.quotedNoteId,
      required this.parentNoteId})
      : _imageXFiles = imageXFiles;

  @override
  final String text;
  final List<XFile> _imageXFiles;
  @override
  List<XFile> get imageXFiles {
    if (_imageXFiles is EqualUnmodifiableListView) return _imageXFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageXFiles);
  }

  @override
  final int? quotedNoteId;
  @override
  final int? parentNoteId;

  @override
  String toString() {
    return 'SendNoteDto(text: $text, imageXFiles: $imageXFiles, quotedNoteId: $quotedNoteId, parentNoteId: $parentNoteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendNoteDto &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._imageXFiles, _imageXFiles) &&
            (identical(other.quotedNoteId, quotedNoteId) ||
                other.quotedNoteId == quotedNoteId) &&
            (identical(other.parentNoteId, parentNoteId) ||
                other.parentNoteId == parentNoteId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      const DeepCollectionEquality().hash(_imageXFiles),
      quotedNoteId,
      parentNoteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendNoteDtoCopyWith<_$_SendNoteDto> get copyWith =>
      __$$_SendNoteDtoCopyWithImpl<_$_SendNoteDto>(this, _$identity);
}

abstract class _SendNoteDto implements SendNoteDto {
  factory _SendNoteDto(
      {required final String text,
      required final List<XFile> imageXFiles,
      required final int? quotedNoteId,
      required final int? parentNoteId}) = _$_SendNoteDto;

  @override
  String get text;
  @override
  List<XFile> get imageXFiles;
  @override
  int? get quotedNoteId;
  @override
  int? get parentNoteId;
  @override
  @JsonKey(ignore: true)
  _$$_SendNoteDtoCopyWith<_$_SendNoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
