import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/create_note/create_note_dialog.dart';
import 'package:selfdevers/create_note/widgets/quoted_note_view.dart';
import 'package:selfdevers/feed/widgets/network_note_image_view.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';
import 'package:selfdevers/feed/widgets/note_image_view.dart';
import 'package:selfdevers/feed/widgets/note_repost_button.dart';
import 'package:selfdevers/note/note_screen.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/styles/text_styles.dart';
import 'package:selfdevers/widgets/animated_neon_text_style.dart';
import 'package:selfdevers/widgets/neon_hover_container.dart';
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
  bool _isTileHovered = false;
  bool _isUserHovered = false;

  late NoteDto note = widget.note;

  void _onUserHovered() {
    setState(() => _isUserHovered = true);
  }

  void _onUserNotHovered() {
    setState(() => _isUserHovered = false);
  }

  void _goToProfile() {
    context.push('/profile/${widget.note.creator.userTag}');
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (_) => ProfileScreen(userTag: widget.note.creator.userTag),
    // ));
  }

  Future<void> _like() async {
    await ref.read(notesServiceProvider).like(noteId: widget.note.id);
    setState(() {
      note = note.copyWith(isLikedByMe: true, likeCount: note.likeCount + 1);
    });
  }

  Future<void> _unlike() async {
    await ref.read(notesServiceProvider).unlike(noteId: widget.note.id);
    setState(() {
      note = note.copyWith(isLikedByMe: false, likeCount: note.likeCount - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return NeonHoverContainer(
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NoteScreen(),
            ));
          },
          child: Ink(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MouseRegion(
                    onEnter: (_) => _onUserHovered(),
                    onExit: (_) => _onUserNotHovered(),
                    child: UserAvatar(
                      onTap: widget.onProfileTap ?? _goToProfile,
                      imageProvider: (widget.note.creator.avatar != null)
                          ? NetworkImage(widget.note.creator.avatar!.url)
                          : null,
                      blurhash: widget.note.creator.avatar?.blurhash,
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
                                      text: DateFormat.d()
                                          .format(widget.note.creationDate),
                                      style: TextStyles.light2),
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
                              onPressed: () {},
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
    );
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

  Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NoteActionButton(
          onPressed: () {},
          iconData: Icons.mode_comment_outlined,
          label: '-1',
        ),
        NoteQuoteButton(
          onPressed: () {
            showCreateNoteDialog(context, quotedNoteDto: note);
          },
          quoteCount: note.quoteCount,
        ),
        NoteLikeButton(
          onChanged: (isLiked) {
            if (isLiked) {
              _like();
            } else {
              _unlike();
            }
          },
          likeCount: note.likeCount,
          isLiked: note.isLikedByMe,
        ),
        NoteActionButton(
          onPressed: null,
          iconData: Icons.remove_red_eye,
          label: '100',
        ),
      ],
    );
  }
}

class NoteLikeButton extends StatefulWidget {
  final void Function(bool isLiked) onChanged;
  final bool isLiked;
  final int? likeCount;

  const NoteLikeButton({
    Key? key,
    required this.onChanged,
    this.likeCount,
    required this.isLiked,
  }) : super(key: key);

  @override
  State<NoteLikeButton> createState() => _NoteLikeButtonState();
}

class _NoteLikeButtonState extends State<NoteLikeButton> {
  late bool _isLiked;
  late int? _likeCount;

  @override
  void initState() {
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NoteActionButton(
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;

          if (_likeCount != null) {
            if (_isLiked) {
              _likeCount = _likeCount! + 1;
            } else {
              _likeCount = _likeCount! - 1;
            }
          }

          widget.onChanged(_isLiked);
        });
      },
      hoverColor: Colors.pink,
      iconData: _isLiked ? Icons.favorite : Icons.favorite_border,
      label: (_likeCount != null) ? '$_likeCount' : null,
      contentColor: _isLiked ? Colors.pink : null,
      // child: Wrap(
      //   crossAxisAlignment: WrapCrossAlignment.center,
      //   children: [
      //     Icon(
      //
      //       size: 16,
      //       color: _isLiked
      //           ? Colors.pink
      //           : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
      //     ),
      //     if (_likeCount != null)
      //       Padding(
      //         padding: const EdgeInsets.only(left: 8.0),
      //         child: Text(
      //           '$_likeCount',
      //           style: TextStyle(
      //               color: _isLiked
      //                   ? Colors.pink
      //                   : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
      //           ),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
