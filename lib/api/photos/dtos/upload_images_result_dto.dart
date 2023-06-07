import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_images_result_dto.freezed.dart';
part 'upload_images_result_dto.g.dart';

@freezed
class UploadImagesResultDto with _$UploadImagesResultDto {
  factory UploadImagesResultDto({
    required List<int> imageIds,
  }) = _UploadImagesResultDto;

  factory UploadImagesResultDto.fromJson(Map<String, dynamic> json) => _$UploadImagesResultDtoFromJson(json);
}