import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';

class CropImageScreen extends StatelessWidget {
  final String url;

  const CropImageScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CropController(
      /// If not specified, [aspectRatio] will not be enforced.
      aspectRatio: 3 / 1,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Обрезать фото'),
      ),
      body: Center(
        child: CropImage(
          /// Only needed if you expect to make use of its functionality like setting initial values of
          /// [aspectRatio] and [defaultCrop].
          controller: controller,
          /// The image to be cropped. Use [Image.file] or [Image.network] or any other [Image].
          image: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
