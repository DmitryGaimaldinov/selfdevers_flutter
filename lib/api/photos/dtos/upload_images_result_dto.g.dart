// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_images_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadImagesResultDto _$$_UploadImagesResultDtoFromJson(
        Map<String, dynamic> json) =>
    _$_UploadImagesResultDto(
      imageIds:
          (json['imageIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_UploadImagesResultDtoToJson(
        _$_UploadImagesResultDto instance) =>
    <String, dynamic>{
      'imageIds': instance.imageIds,
    };
