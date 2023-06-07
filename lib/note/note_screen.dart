import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:selfdevers/feed/note.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/note/widgets/comment_view.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/styles/text_styles.dart';
import 'package:selfdevers/widgets/my_divider.dart';
import 'package:selfdevers/widgets/underline_text_button.dart';

import '../profile/user.dart';

class NoteScreen extends ConsumerWidget {
  const NoteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пост'),
      ),
      body: SingleChildScrollView(
        child: CenterConstrained(
          child: Column(
            children: [
              DetailedNoteView(note: Note(
                0,
                'Какая-то запись',
                User(id: 0, name: 'name', userTag: 'userTag', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
                false,
                DateTime.now(),
              )),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommentView(
                      commentViewDto: CommentViewDto(note: Note(
                        index,
                        'Запись $index',
                        User(id: index, name: 'name$index', userTag: 'user$index', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
                        false,
                        DateTime.now(),
                      )),
                      // commentIds: [],
                    ),
                  );
                },
              ),
              if (ref.watch(isMobileModeProvider) == true)
                _BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class DetailedNoteView extends StatelessWidget {
  final Note note;

  const DetailedNoteView({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
            top: Radius.circular(16),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 8),
            Text(
              note.text,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 8),
            MyDivider(),
            // SizedBox(height: 8),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                children: [
                  CounterButton(
                    onPressed: () {},
                    countLabel: '10',
                    label: 'репостов',
                  ),
                  CounterButton(
                    onPressed: () {},
                    countLabel: '1',
                    label: 'цитата',
                  ),
                  CounterButton(
                    onPressed: () {},
                    countLabel: '48',
                    label: 'лайков',
                  ),
                  CounterButton(
                    onPressed: null,
                    countLabel: '1328',
                    label: 'просмотров',
                  ),
                ],
              ),
            ),
            MyDivider(),
            // SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: WrapCrossAlignment.center,
              // alignment: WrapAlignment.spaceEvenly,
              // spacing: 16,
              children: [
                NoteActionButton(
                  onPressed: () {},
                  iconData: Icons.mode_comment_outlined,
                ),
                NoteActionButton(
                  onPressed: () {},
                  iconData: Icons.repeat,
                ),
                NoteLikeButton(
                  onChanged: (isLiked) {},
                  isLiked: false,
                ),
                // IconButton(onPressed: () {}, icon: Icon(Icons.mode_comment_outlined, size: 16, color: Colors.black.withOpacity(0.6))),
                // IconButton(onPressed: () {}, icon: Icon(Icons.repeat, size: 16, color: Colors.black.withOpacity(0.6))),
                // IconButton(onPressed: () {}, icon: Icon(Icons.favorite, size: 16, color: Colors.black.withOpacity(0.6))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(
          imageProvider: (note.creator.avatarUrl != null)
              ? NetworkImage(note.creator.avatarUrl!)
              : null,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: note.creator.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: ' @${note.creator.userTag}',
                      style: TextStyles.light1,
                    ),
                  ]
                )
              ),
              Text.rich(
                style: TextStyles.light2,
                TextSpan(
                  children: [
                    TextSpan(
                      text: DateFormat.yMMMMd('ru').format(note.creationDate),
                    ),
                    TextSpan(text: ' в '),
                    TextSpan(
                      text: '${DateFormat.Hm().format(note.creationDate)}',
                    ),
                  ]
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
        child: Text.rich(
          TextSpan(
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
            ]
          )
        ),
      ),
    );
  }
}


