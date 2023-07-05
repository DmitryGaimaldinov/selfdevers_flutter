import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
import 'package:selfdevers/create_note/create_note_dialog.dart';
import 'package:selfdevers/create_note/widgets/quoted_note_view.dart';
import 'package:selfdevers/feed/note.dart';
import 'package:selfdevers/feed/widgets/network_note_image_view.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';
import 'package:selfdevers/feed/widgets/note_like_button.dart';
import 'package:selfdevers/feed/widgets/note_repost_button.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/home/widgets/current_user_in_rail.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/note/note_comments_notifier.dart';
import 'package:selfdevers/note/note_notifier.dart';
import 'package:selfdevers/note/widgets/comment_view.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/screens/error_screen.dart';
import 'package:selfdevers/styles/text_styles.dart';
import 'package:selfdevers/widgets/my_divider.dart';
import 'package:selfdevers/widgets/show_images_dialog.dart';

class NoteScreen extends ConsumerWidget {
  final int noteId;
  final NoteDto? noteDto;

  const NoteScreen({
    Key? key,
    required this.noteId,
    this.noteDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пост'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final noteState = ref.watch(noteStateProvider(noteId));
          return noteState.when(
              loading: () {
                if (noteDto == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _NoteBody(noteDto: noteDto!);
              },
              loaded: (noteDto) {
                return _NoteBody(noteDto: noteDto);
              },
              error: () {
                return ErrorScreen();
              }
          );
        }
      ),
    );
  }
}

class _NoteBody extends ConsumerStatefulWidget {
  final NoteDto noteDto;

  const _NoteBody({
    Key? key,
    required this.noteDto,
  }) : super(key: key);

  @override
  ConsumerState<_NoteBody> createState() => _NoteBodyState();
}

class _NoteBodyState extends ConsumerState<_NoteBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CenterConstrained(
        child: Column(
          children: [
            DetailedNoteView(
              note: widget.noteDto,
            ),
            SizedBox(height: 16),
            _buildComments(),
          ],
        ),
      ),
    );
  }

  Widget _buildComments() {
    final noteCommentsState = ref.watch(noteCommentsProvider(widget.noteDto.id));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: noteCommentsState.when(
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
        loaded: (List<NoteDto> comments) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return NoteTile(note: comments[index]);
            }
          );
        }
      ),
    );
  }
}

class DetailedNoteView extends ConsumerStatefulWidget {
  final NoteDto note;

  const DetailedNoteView({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  ConsumerState<DetailedNoteView> createState() => _DetailedNoteViewState();
}

class _DetailedNoteViewState extends ConsumerState<DetailedNoteView> {
  late NoteDto note = widget.note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
            top: Radius.circular(16),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                MyDivider(),
                // Кнопки-счётчики
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    children: [
                      CounterButton(
                        onPressed: null,
                        countLabel: '${note.commentCount}',
                        label: 'комментариев',
                      ),
                      CounterButton(
                        onPressed: () {},
                        countLabel: '${note.quoteCount}',
                        label: 'репостов',
                      ),
                      CounterButton(
                        onPressed: () {},
                        countLabel: '${note.likeCount}',
                        label: 'лайков',
                      ),
                    ],
                  ),
                ),
                MyDivider(),
                // Кнопки-иконки
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NoteActionButton(
                      onPressed: () async {
                        final isNoteCreated = await showCreateNoteDialog(context, parentNoteDto: note);
                        if (isNoteCreated) {
                          ref.read(noteCommentsProvider(note.id).notifier).refresh();
                        }
                      },
                      iconData: Icons.mode_comment_outlined,
                    ),
                    NoteQuoteButton(
                      noteDto: note,
                    ),
                    NoteLikeButton(
                      isLiked: note.isLikedByMe,
                      noteId: note.id,
                      onChanged: (isLiked) {
                        setState(() {
                          note = note.copyWith(likeCount: note.likeCount + (isLiked ? 1 : -1));
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
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

  Row _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar.network(widget.note.creator.avatar),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: widget.note.creator.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: ' @${widget.note.creator.userTag}',
                  style: TextStyles.light1,
                ),
              ])),
              Text.rich(
                  style: TextStyles.light2,
                  TextSpan(children: [
                    TextSpan(
                      text: DateFormat.yMMMMd('ru').format(widget.note.creationDate),
                    ),
                    TextSpan(text: ' в '),
                    TextSpan(
                      text: '${DateFormat.Hm().format(widget.note.creationDate)}',
                    ),
                  ])),
            ],
          ),
        ),
      ],
    );
  }
}

// class CreateCommentView extends StatelessWidget {
//   const CreateCommentView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CurrentUserAvatar(),
//         Expanded(
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   border: UnderlineInputBorder(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


class CounterButton extends StatelessWidget {
  final void Function()? onPressed;
  final String countLabel;
  final String label;

  const CounterButton({
    Key? key,
    required this.onPressed,
    required this.countLabel,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.all(8),
        child: Text.rich(TextSpan(
            style: TextStyles.light1,
            recognizer: TapGestureRecognizer()..onTap = () {},
            children: [
              TextSpan(
                text: countLabel,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' $label',
              ),
            ])),
      ),
    );
  }
}
