// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_images_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadImagesResultDto _$UploadImagesResultDtoFromJson(
    Map<String, dynamic> json) {
  return _UploadImagesResultDto.fromJson(json);
}

/// @nodoc
mixin _$UploadImagesResultDto {
  List<int> get imageIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadImagesResultDtoCopyWith<UploadImagesResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadImagesResultDtoCopyWith<$Res> {
  factory $UploadImagesResultDtoCopyWith(UploadImagesResultDto value,
          $Res Function(UploadImagesResultDto) then) =
      _$UploadImagesResultDtoCopyWithImpl<$Res, UploadImagesResultDto>;
  @useResult
  $Res call({List<int> imageIds});
}

/// @nodoc
class _$UploadImagesResultDtoCopyWithImpl<$Res,
        $Val extends UploadImagesResultDto>
    implements $UploadImagesResultDtoCopyWith<$Res> {
  _$UploadImagesResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageIds = null,
  }) {
    return _then(_value.copyWith(
      imageIds: null == imageIds
          ? _value.imageIds
          : imageIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadImagesResultDtoCopyWith<$Res>
    implements $UploadImagesResultDtoCopyWith<$Res> {
  factory _$$_UploadImagesResultDtoCopyWith(_$_UploadImagesResultDto value,
          $Res Function(_$_UploadImagesResultDto) then) =
      __$$_UploadImagesResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> imageIds});
}

/// @nodoc
class __$$_UploadImagesResultDtoCopyWithImpl<$Res>
    extends _$UploadImagesResultDtoCopyWithImpl<$Res, _$_UploadImagesResultDto>
    implements _$$_UploadImagesResultDtoCopyWith<$Res> {
  __$$_UploadImagesResultDtoCopyWithImpl(_$_UploadImagesResultDto _value,
      $Res Function(_$_UploadImagesResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageIds = null,
  }) {
    return _then(_$_UploadImagesResultDto(
      imageIds: null == imageIds
          ? _value._imageIds
          : imageIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadImagesResultDto implements _UploadImagesResultDto {
  _$_UploadImagesResultDto({required final List<int> imageIds})
      : _imageIds = imageIds;

  factory _$_UploadImagesResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_UploadImagesResultDtoFromJson(json);

  final List<int> _imageIds;
  @override
  List<int> get imageIds {
    if (_imageIds is EqualUnmodifiableListView) return _imageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageIds);
  }

  @override
  String toString() {
    return 'UploadImagesResultDto(imageIds: $imageIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImagesResultDto &&
            const DeepCollectionEquality().equals(other._imageIds, _imageIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_imageIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImagesResultDtoCopyWith<_$_UploadImagesResultDto> get copyWith =>
      __$$_UploadImagesResultDtoCopyWithImpl<_$_UploadImagesResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadImagesResultDtoToJson(
      this,
    );
  }
}

abstract class _UploadImagesResultDto implements UploadImagesResultDto {
  factory _UploadImagesResultDto({required final List<int> imageIds}) =
      _$_UploadImagesResultDto;

  factory _UploadImagesResultDto.fromJson(Map<String, dynamic> json) =
      _$_UploadImagesResultDto.fromJson;

  @override
  List<int> get imageIds;
  @override
  @JsonKey(ignore: true)
  _$$_UploadImagesResultDtoCopyWith<_$_UploadImagesResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
