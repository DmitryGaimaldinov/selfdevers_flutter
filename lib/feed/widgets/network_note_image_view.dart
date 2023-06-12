import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/feed/widgets/note_image_view.dart';

class NetworkNoteImageView extends StatelessWidget {
  final ImageDto imageDto;

  const NetworkNoteImageView(this.imageDto, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageDto.url,
      imageBuilder: (context, provider) {
        return NoteImageView(imageProvider: provider);
      },
      placeholder: (context, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BlurHash(hash: imageDto.blurhash),
        );
      },
    );
  }
}
