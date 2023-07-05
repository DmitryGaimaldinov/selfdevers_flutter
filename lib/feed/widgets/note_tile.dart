import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/create_note/create_note_dialog.dart';
import 'package:selfdevers/create_note/widgets/quoted_note_view.dart';
import 'package:selfdevers/feed/widgets/network_note_image_view.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';
import 'package:selfdevers/feed/widgets/note_image_view.dart';
import 'package:selfdevers/feed/widgets/note_like_button.dart';
import 'package:selfdevers/feed/widgets/note_repost_button.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/note/note_screen.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/styles/text_styles.dart';
import 'package:selfdevers/widgets/animated_neon_text_style.dart';
import 'package:selfdevers/widgets/neon_hover_container.dart';
import 'package:selfdevers/widgets/show_images_dialog.dart';
import 'package:selfdevers/widgets/tap_scale.dart';
import 'package:selfdevers/widgets/underline_text_button.dart';

class NoteTile extends ConsumerStatefulWidget {
  final NoteDto note;
  final VoidCallback? onProfileTap;

  const NoteTile({
    Key? key,
    required this.note,
    this.onProfileTap,
  }) : super(key: key);

  @override
  ConsumerState<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends ConsumerState<NoteTile> {
  late NoteDto note = widget.note;

  bool _isUserHovered = false;

  void _onUserHovered() {
    setState(() => _isUserHovered = true);
  }

  void _onUserNotHovered() {
    setState(() => _isUserHovered = false);
  }

  void _goToProfile() {
    context.push('/profile/${widget.note.creator.userTag}');
  }

  void _goToNote() {
    context.push('/note/${widget.note.id}', extra: widget.note);
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: CenterConstrained(
        child: NeonHoverContainer(
          borderRadius: borderRadius,
          child: Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                _goToNote();
              },
              child: Ink(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  borderRadius: borderRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MouseRegion(
                        onEnter: (_) => _onUserHovered(),
                        onExit: (_) => _onUserNotHovered(),
                        child: UserAvatar.network(
                          note.creator.avatar,
                          onTap: widget.onProfileTap ?? _goToProfile,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MouseRegion(
                              onEnter: (_) => _onUserHovered(),
                              onExit: (_) => _onUserNotHovered(),
                              child: GestureDetector(
                                onTap: widget.onProfileTap ?? _goToProfile,
                                child: Text.rich(TextSpan(
                                    style: _isUserHovered
                                        ? TextStyles.underlinedButton(context)
                                        : null,
                                    children: [
                                      TextSpan(
                                        text: widget.note.creator.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const WidgetSpan(child: SizedBox(width: 4)),
                                      TextSpan(
                                        text: '@${widget.note.creator.userTag}',
                                        style: TextStyles.light1,
                                      ),
                                      const WidgetSpan(child: SizedBox(width: 4)),
                                      TextSpan(
                                          style: TextStyles.light2,
                                          children: [
                                            TextSpan(
                                              text: DateFormat.yMMMMd('ru').format(widget.note.creationDate),
                                            ),
                                            TextSpan(text: ' в '),
                                            TextSpan(
                                              text: '${DateFormat.Hm().format(widget.note.creationDate)}',
                                            ),
                                          ]
                                      ),
                                    ])),
                              ),
                            ),
                            Text(
                              widget.note.text,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            if (note.images.isNotEmpty)
                              _buildImages(),

                            if (note.quotedNoteDto != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: QuotedNoteView(
                                  note: note.quotedNoteDto!,
                                  onPressed: () {
                                    context.push('/note/${note.quotedNoteDto!.id}', extra: note.quotedNoteDto);
                                  },
                                ),
                              ),


                            SizedBox(height: 8),
                            _buildButtons(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showImageDialog(ImageDto imageDto) async {
    await showImageDialog(context: context, imageDto: imageDto);
  }

  Widget _buildImages() {
    final images = widget.note.images;

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
                    Expanded(
                      child: NetworkNoteImageView(images[0], onTap: () => _showImageDialog(images[0])),
                    ),
                    if (images.length == 4)
                      const SizedBox(height: spaceBetween),
                    if (images.length == 4)
                      Expanded(child: NetworkNoteImageView(images[2], onTap: () => _showImageDialog(images[2]))),
                  ],
                )),
            if (images.length > 1)
              const SizedBox(width: spaceBetween),
            if (images.length > 1)
              Expanded(
                  child: Column(
                    children: [
                      Expanded(child: NetworkNoteImageView(images[1], onTap: () => _showImageDialog(images[1]))),
                      if (images.length == 3 ||
                          images.length == 4)
                        const SizedBox(height: spaceBetween),
                      if (images.length == 3)
                        Expanded(child: NetworkNoteImageView(images[2], onTap: () => _showImageDialog(images[2]))),
                      if (images.length == 4)
                        Expanded(child: NetworkNoteImageView(images[3], onTap: () => _showImageDialog(images[3]))),
                    ],
                  )),
          ],
        ),
      ),
    );
  }

  Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NoteActionButton(
          onPressed: _goToNote,
          iconData: Icons.mode_comment_outlined,
          label: '${note.commentCount}',
        ),
        NoteQuoteButton(
          quoteCount: note.quoteCount,
          noteDto: note,
        ),
        NoteLikeButton(
          likeCount: note.likeCount,
          isLiked: note.isLikedByMe,
          noteId: note.id,
        ),
      ],
    );
  }
}

