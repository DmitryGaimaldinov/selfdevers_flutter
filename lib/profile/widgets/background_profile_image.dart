import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackgroundProfileImage extends StatelessWidget {
  final double height;
  // final Uint8List? imageBytes;
  // final String? imageUrl;
  final ImageProvider? imageProvider;

  const BackgroundProfileImage({
    Key? key,
    // this.imageBytes,
    // this.imageUrl,
    this.imageProvider,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: (imageProvider == null)
            ? null
            : DecorationImage(
                image: imageProvider!,
                fit: BoxFit.fill
              ),
      ),
    );
  }
}
