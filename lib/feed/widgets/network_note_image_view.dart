import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/feed/widgets/note_image_view.dart';

class NetworkNoteImageView extends StatelessWidget {
  final ImageDto imageDto;
  final VoidCallback? onTap;
  final BoxFit boxFit;

  const NetworkNoteImageView(this.imageDto, {
    Key? key,
    this.onTap,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: imageDto.url,
          imageBuilder: (context, provider) {
            return NoteImageView(
              imageProvider: provider,
              onTap: onTap,
              boxFit: boxFit,
            );
          },
          placeholder: (context, _) {
            return InkWell(
              onTap: onTap,
              child: BlurHash(hash: imageDto.blurhash)
            );
          },
        ),
      ),
    );
  }
}
