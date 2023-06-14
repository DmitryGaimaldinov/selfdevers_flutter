import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';

class NoteImageView extends StatelessWidget {
  final ImageProvider imageProvider;
  final VoidCallback? onTap;
  final BoxFit boxFit;

  const NoteImageView({
    Key? key,
    required this.imageProvider,
    this.onTap,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: imageProvider,
      fit: boxFit,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black38,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}