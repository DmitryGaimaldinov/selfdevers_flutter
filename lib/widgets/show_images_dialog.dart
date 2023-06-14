import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/feed/widgets/network_note_image_view.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/widgets/frosted_container.dart';
import 'package:selfdevers/widgets/neon_icon_button.dart';
import 'package:selfdevers/widgets/show_adaptive_dialog.dart';

Future<void> showImageDialog({ required BuildContext context, required ImageDto imageDto}) async {
  return showAdaptiveDialog(
    context: context,
    screen: ShowImageScreen(imageDto),
    // builder: (_) => ShowImageScreen(imageDto),
  );
}

class ShowImageScreen extends ConsumerWidget {
  final ImageDto imageDto;

  const ShowImageScreen(this.imageDto, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: InteractiveViewer(
        child: NetworkNoteImageView(
          imageDto,
          boxFit: BoxFit.contain,
        ),
      ),
    );
  }
}