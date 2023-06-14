import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/photos/dtos/upload_images_result_dto.dart';
import 'package:selfdevers/profile/pick_and_crop_image.dart';

class PhotosService {
  final Ref _ref;
  PhotosService(this._ref);

  Future<UploadImagesResultDto> uploadImages({
    required List<MemoryNamedImage> memoryNamedImages,
    CancelToken? cancelToken,
  }) async {
    final formData = FormData();
    for (final image in memoryNamedImages) {
      debugPrint('filename: ${image.filename}');
      formData.files.add(
        MapEntry(
            'images',
            MultipartFile.fromBytes(image.imageBytes,
                filename: image.filename)),
      );
    }

    final response = await _ref.read(apiProvider).post(
          'photos/upload-images',
          formData,
          cancelToken,
        );

    debugPrint('${response.data}');

    return UploadImagesResultDto.fromJson(response.data);
  }
}
