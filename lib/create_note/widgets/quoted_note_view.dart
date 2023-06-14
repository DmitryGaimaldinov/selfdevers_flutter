import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/feed/widgets/network_note_image_view.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/styles/text_styles.dart';

class QuotedNoteView extends StatelessWidget {
  final NoteDto note;
  final VoidCallback? onPressed;

  const QuotedNoteView({
    Key? key,
    required this.note,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1)
      ),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatar.network(note.creator.avatar),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: note.creator.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const WidgetSpan(child: SizedBox(width: 4)),
                            TextSpan(
                              text: '@${note.creator.userTag}',
                              style: TextStyles.light1,
                            ),
                            const WidgetSpan(child: SizedBox(width: 4)),
                            TextSpan(
                                style: TextStyles.light2,
                                children: [
                                  TextSpan(
                                    text: DateFormat.yMMMMd('ru').format(note.creationDate),
                                  ),
                                  TextSpan(text: ' в '),
                                  TextSpan(
                                    text: '${DateFormat.Hm().format(note.creationDate)}',
                                  ),
                                ]
                            ),
                          ])),
                      Text(
                        note.text,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      if (note.images.isNotEmpty)
                        _buildImages(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImages() {
    final images = note.images;

    const spaceBetween = 8.0;

    print('build images');

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Column(
                  children: [
                    Expanded(child: NetworkNoteImageView(images[0])),
                    if (images.length == 4)
                      const SizedBox(height: spaceBetween),
                    if (images.length == 4)
                      Expanded(child: NetworkNoteImageView(images[2])),
                  ],
                )),
            if (images.length > 1)
              const SizedBox(width: spaceBetween),
            if (images.length > 1)
              Expanded(
                  child: Column(
                    children: [
                      Expanded(child: NetworkNoteImageView(images[1])),
                      if (images.length == 3 ||
                          images.length == 4)
                        const SizedBox(height: spaceBetween),
                      if (images.length == 3)
                        Expanded(child: NetworkNoteImageView(images[2])),
                      if (images.length == 4)
                        Expanded(child: NetworkNoteImageView(images[3])),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
