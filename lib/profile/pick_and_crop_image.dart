import 'dart:io';
import 'dart:typed_data';

import 'package:crop_image/crop_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;
import 'package:path/path.dart' as path;
import 'package:selfdevers/main.dart';
import 'package:selfdevers/widgets/frosted_container.dart';
import 'package:selfdevers/widgets/neon_outlined_button.dart';
import 'package:selfdevers/widgets/show_adaptive_dialog.dart';

class MemoryNamedImage {
  final String filename;
  final Uint8List imageBytes;

  const MemoryNamedImage({
    required this.filename,
    required this.imageBytes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MemoryNamedImage &&
              runtimeType == other.runtimeType &&
              filename == other.filename &&
              imageBytes == other.imageBytes;

  @override
  int get hashCode => filename.hashCode ^ imageBytes.hashCode;

  @override
  String toString() {
    return 'PickAndCropImageResult{filename: $filename}';
  }
}

Future<MemoryNamedImage?> pickAndCropImage({
  required BuildContext context,
  required ImageSource imageSource,
  required double aspectRatio,
}) async {
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (file != null) {
    final controller = CropController(
      aspectRatio: aspectRatio,
    );

    final bool? isPicked = await showAdaptiveDialog<bool>(
      context: context,
      screen: Scaffold(
        body: FrostedContainer(
          child: Column(
            children: [
              AppBar(
                title: Text('Редактирование изображения'),
                backgroundColor: Colors.transparent,
                actions: [
                  NeonOutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Применить'),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: CropImage(
                    controller: controller,
                    image: Image.network(
                      file.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );

    // final bool? isPicked = await showDialog<bool>(
    //     context: context,
    //     builder: (_) {
    //       return CenterConstrained(
    //         child: Container(
    //           padding: const EdgeInsets.only(
    //             left: 16,
    //             right: 16,
    //             bottom: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               AppBar(
    //                 title: const Text('Редактирование изображения'),
    //                 actions: [
    //                   FilledButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pop(true);
    //                     },
    //                     child: const Text('Применить'),
    //                   )
    //                 ],
    //               ),
    //               CropImage(
    //                 controller: controller,
    //                 image: Image.network(
    //                   file.path,
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     });

    if (isPicked == true) {
      ui.Image bitmap = await controller.croppedBitmap();
      final data = await bitmap.toByteData(format: ui.ImageByteFormat.png);
      final bytes = data!.buffer.asUint8List();

      return MemoryNamedImage(
        filename: path.basenameWithoutExtension(file.path) + '.png',
        imageBytes: bytes,
      );
    }
  }
  return null;
}