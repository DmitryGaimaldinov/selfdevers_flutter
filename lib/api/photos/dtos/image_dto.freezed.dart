// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) {
  return _ImageDto.fromJson(json);
}

/// @nodoc
mixin _$ImageDto {
  String get url => throw _privateConstructorUsedError;
  String get blurhash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDtoCopyWith<ImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDtoCopyWith<$Res> {
  factory $ImageDtoCopyWith(ImageDto value, $Res Function(ImageDto) then) =
      _$ImageDtoCopyWithImpl<$Res, ImageDto>;
  @useResult
  $Res call({String url, String blurhash});
}

/// @nodoc
class _$ImageDtoCopyWithImpl<$Res, $Val extends ImageDto>
    implements $ImageDtoCopyWith<$Res> {
  _$ImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? blurhash = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      blurhash: null == blurhash
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageDtoCopyWith<$Res> implements $ImageDtoCopyWith<$Res> {
  factory _$$_ImageDtoCopyWith(
          _$_ImageDto value, $Res Function(_$_ImageDto) then) =
      __$$_ImageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String blurhash});
}

/// @nodoc
class __$$_ImageDtoCopyWithImpl<$Res>
    extends _$ImageDtoCopyWithImpl<$Res, _$_ImageDto>
    implements _$$_ImageDtoCopyWith<$Res> {
  __$$_ImageDtoCopyWithImpl(
      _$_ImageDto _value, $Res Function(_$_ImageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? blurhash = null,
  }) {
    return _then(_$_ImageDto(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      blurhash: null == blurhash
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageDto implements _ImageDto {
  _$_ImageDto({required this.url, required this.blurhash});

  factory _$_ImageDto.fromJson(Map<String, dynamic> json) =>
      _$$_ImageDtoFromJson(json);

  @override
  final String url;
  @override
  final String blurhash;

  @override
  String toString() {
    return 'ImageDto(url: $url, blurhash: $blurhash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageDto &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.blurhash, blurhash) ||
                other.blurhash == blurhash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, blurhash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageDtoCopyWith<_$_ImageDto> get copyWith =>
      __$$_ImageDtoCopyWithImpl<_$_ImageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageDtoToJson(
      this,
    );
  }
}

abstract class _ImageDto implements ImageDto {
  factory _ImageDto(
      {required final String url,
      required final String blurhash}) = _$_ImageDto;

  factory _ImageDto.fromJson(Map<String, dynamic> json) = _$_ImageDto.fromJson;

  @override
  String get url;
  @override
  String get blurhash;
  @override
  @JsonKey(ignore: true)
  _$$_ImageDtoCopyWith<_$_ImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
