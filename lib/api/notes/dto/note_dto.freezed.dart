// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) {
  return _NoteDto.fromJson(json);
}

/// @nodoc
mixin _$NoteDto {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<ImageDto> get images => throw _privateConstructorUsedError;
  bool get isQuoted => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  UserDto get creator => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  bool get isMyNote => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLikedByMe => throw _privateConstructorUsedError;
  int get quoteCount => throw _privateConstructorUsedError;
  NoteDto? get quotedNoteDto => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDtoCopyWith<NoteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDtoCopyWith<$Res> {
  factory $NoteDtoCopyWith(NoteDto value, $Res Function(NoteDto) then) =
      _$NoteDtoCopyWithImpl<$Res, NoteDto>;
  @useResult
  $Res call(
      {int id,
      String text,
      List<ImageDto> images,
      bool isQuoted,
      bool isEdited,
      UserDto creator,
      DateTime creationDate,
      bool isMyNote,
      int likeCount,
      bool isLikedByMe,
      int quoteCount,
      NoteDto? quotedNoteDto,
      int commentCount});

  $UserDtoCopyWith<$Res> get creator;
  $NoteDtoCopyWith<$Res>? get quotedNoteDto;
}

/// @nodoc
class _$NoteDtoCopyWithImpl<$Res, $Val extends NoteDto>
    implements $NoteDtoCopyWith<$Res> {
  _$NoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? images = null,
    Object? isQuoted = null,
    Object? isEdited = null,
    Object? creator = null,
    Object? creationDate = null,
    Object? isMyNote = null,
    Object? likeCount = null,
    Object? isLikedByMe = null,
    Object? quoteCount = null,
    Object? quotedNoteDto = freezed,
    Object? commentCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>,
      isQuoted: null == isQuoted
          ? _value.isQuoted
          : isQuoted // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserDto,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isMyNote: null == isMyNote
          ? _value.isMyNote
          : isMyNote // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLikedByMe: null == isLikedByMe
          ? _value.isLikedByMe
          : isLikedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      quoteCount: null == quoteCount
          ? _value.quoteCount
          : quoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      quotedNoteDto: freezed == quotedNoteDto
          ? _value.quotedNoteDto
          : quotedNoteDto // ignore: cast_nullable_to_non_nullable
              as NoteDto?,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get creator {
    return $UserDtoCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteDtoCopyWith<$Res>? get quotedNoteDto {
    if (_value.quotedNoteDto == null) {
      return null;
    }

    return $NoteDtoCopyWith<$Res>(_value.quotedNoteDto!, (value) {
      return _then(_value.copyWith(quotedNoteDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NoteDtoCopyWith<$Res> implements $NoteDtoCopyWith<$Res> {
  factory _$$_NoteDtoCopyWith(
          _$_NoteDto value, $Res Function(_$_NoteDto) then) =
      __$$_NoteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String text,
      List<ImageDto> images,
      bool isQuoted,
      bool isEdited,
      UserDto creator,
      DateTime creationDate,
      bool isMyNote,
      int likeCount,
      bool isLikedByMe,
      int quoteCount,
      NoteDto? quotedNoteDto,
      int commentCount});

  @override
  $UserDtoCopyWith<$Res> get creator;
  @override
  $NoteDtoCopyWith<$Res>? get quotedNoteDto;
}

/// @nodoc
class __$$_NoteDtoCopyWithImpl<$Res>
    extends _$NoteDtoCopyWithImpl<$Res, _$_NoteDto>
    implements _$$_NoteDtoCopyWith<$Res> {
  __$$_NoteDtoCopyWithImpl(_$_NoteDto _value, $Res Function(_$_NoteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? images = null,
    Object? isQuoted = null,
    Object? isEdited = null,
    Object? creator = null,
    Object? creationDate = null,
    Object? isMyNote = null,
    Object? likeCount = null,
    Object? isLikedByMe = null,
    Object? quoteCount = null,
    Object? quotedNoteDto = freezed,
    Object? commentCount = null,
  }) {
    return _then(_$_NoteDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>,
      isQuoted: null == isQuoted
          ? _value.isQuoted
          : isQuoted // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserDto,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isMyNote: null == isMyNote
          ? _value.isMyNote
          : isMyNote // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLikedByMe: null == isLikedByMe
          ? _value.isLikedByMe
          : isLikedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      quoteCount: null == quoteCount
          ? _value.quoteCount
          : quoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      quotedNoteDto: freezed == quotedNoteDto
          ? _value.quotedNoteDto
          : quotedNoteDto // ignore: cast_nullable_to_non_nullable
              as NoteDto?,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDto implements _NoteDto {
  _$_NoteDto(
      {required this.id,
      required this.text,
      required final List<ImageDto> images,
      required this.isQuoted,
      required this.isEdited,
      required this.creator,
      required this.creationDate,
      required this.isMyNote,
      required this.likeCount,
      required this.isLikedByMe,
      required this.quoteCount,
      this.quotedNoteDto,
      required this.commentCount})
      : _images = images;

  factory _$_NoteDto.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDtoFromJson(json);

  @override
  final int id;
  @override
  final String text;
  final List<ImageDto> _images;
  @override
  List<ImageDto> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final bool isQuoted;
  @override
  final bool isEdited;
  @override
  final UserDto creator;
  @override
  final DateTime creationDate;
  @override
  final bool isMyNote;
  @override
  final int likeCount;
  @override
  final bool isLikedByMe;
  @override
  final int quoteCount;
  @override
  final NoteDto? quotedNoteDto;
  @override
  final int commentCount;

  @override
  String toString() {
    return 'NoteDto(id: $id, text: $text, images: $images, isQuoted: $isQuoted, isEdited: $isEdited, creator: $creator, creationDate: $creationDate, isMyNote: $isMyNote, likeCount: $likeCount, isLikedByMe: $isLikedByMe, quoteCount: $quoteCount, quotedNoteDto: $quotedNoteDto, commentCount: $commentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isQuoted, isQuoted) ||
                other.isQuoted == isQuoted) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.isMyNote, isMyNote) ||
                other.isMyNote == isMyNote) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLikedByMe, isLikedByMe) ||
                other.isLikedByMe == isLikedByMe) &&
            (identical(other.quoteCount, quoteCount) ||
                other.quoteCount == quoteCount) &&
            (identical(other.quotedNoteDto, quotedNoteDto) ||
                other.quotedNoteDto == quotedNoteDto) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      const DeepCollectionEquality().hash(_images),
      isQuoted,
      isEdited,
      creator,
      creationDate,
      isMyNote,
      likeCount,
      isLikedByMe,
      quoteCount,
      quotedNoteDto,
      commentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteDtoCopyWith<_$_NoteDto> get copyWith =>
      __$$_NoteDtoCopyWithImpl<_$_NoteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDtoToJson(
      this,
    );
  }
}

abstract class _NoteDto implements NoteDto {
  factory _NoteDto(
      {required final int id,
      required final String text,
      required final List<ImageDto> images,
      required final bool isQuoted,
      required final bool isEdited,
      required final UserDto creator,
      required final DateTime creationDate,
      required final bool isMyNote,
      required final int likeCount,
      required final bool isLikedByMe,
      required final int quoteCount,
      final NoteDto? quotedNoteDto,
      required final int commentCount}) = _$_NoteDto;

  factory _NoteDto.fromJson(Map<String, dynamic> json) = _$_NoteDto.fromJson;

  @override
  int get id;
  @override
  String get text;
  @override
  List<ImageDto> get images;
  @override
  bool get isQuoted;
  @override
  bool get isEdited;
  @override
  UserDto get creator;
  @override
  DateTime get creationDate;
  @override
  bool get isMyNote;
  @override
  int get likeCount;
  @override
  bool get isLikedByMe;
  @override
  int get quoteCount;
  @override
  NoteDto? get quotedNoteDto;
  @override
  int get commentCount;
  @override
  @JsonKey(ignore: true)
  _$$_NoteDtoCopyWith<_$_NoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
