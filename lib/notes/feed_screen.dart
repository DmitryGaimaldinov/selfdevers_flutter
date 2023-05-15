import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/notes/notifier/feed_notifier.dart';
import 'package:selfdevers/notes/notifier/feed_state.dart';
import 'package:selfdevers/profile/widgets/user_circle_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../create_note/create_note_dialog.dart';
import '../styles/text_styles.dart';
import 'note.dart';

class FeedScreen extends StatelessWidget {
  final panelController = PanelController();

  FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лента'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.more_vert)
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final feedState = ref.watch(feedNotifierProvider);

          if (feedState is FeedStateInitializing) {
            return Center(child: CircularProgressIndicator());
          } else if (feedState is FeedStateError) {
            return Center(child: Text('Ошибка'));
          } else if (feedState is FeedStateLoaded) {
            final notes = feedState.notes;

            return Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 16),
                        FilterChip(
                          onSelected: (bool value) {  },
                          label: Text('Программирование'),
                        ),
                        SizedBox(width: 8),
                        FilterChip(
                            onSelected: (bool value) {  },
                            label: Text('Фитнес')
                        ),
                        SizedBox(width: 8),
                        FilterChip(
                            onSelected: (bool value) {  },
                            label: Text('Веб-дизайн')
                        ),
                        SizedBox(width: 8),
                        FilterChip(
                            onSelected: (bool value) {
                              // Сделать переход на экран поиска
                            },
                            label: Text(
                              'Показать все тэги',
                              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: notes.length,
                      itemBuilder: (_, index) {
                        return _NoteTile(note: notes[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 1,
                        );
                      },
                    ),
                  ),
                ],
            );
          }

          throw 'Нет экрана для feedState: $feedState';
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if (panelController.isPanelOpen) {
          //   panelController.close();
          // } else {
          //   panelController.open();
          // }

          showCreateNoteDialog(context);
        },
        child: Icon(Icons.mode_edit),
      ),
    );
  }
}

// TODO: Вынести NoteTile в отедльный файл и разбить всё на подвиджеты:
// _NoteTileHeader, NoteTileBody, NoteTileBottomActions
class _NoteTile extends StatelessWidget {
  final Note note;

  const _NoteTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Ink(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.text,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 500,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.mode_comment_outlined, size: 16, color: Colors.black.withOpacity(0.6)),
                              SizedBox(width: 8),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.repeat, size: 16, color: Colors.black.withOpacity(0.6)),
                              SizedBox(width: 8),
                              Text('16'),
                            ],
                          ),
                          _LikeButton(
                              onChanged: (isLiked) {
                                // TODO
                              },
                              likeCount: 16,
                              isLiked: false,
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.remove_red_eye, size: 16, color: Colors.black.withOpacity(0.6)),
                              SizedBox(width: 8),
                              Text('100'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleUserAvatar(
          imageProvider: (note.creator.avatarUrl != null)
              ? NetworkImage(note.creator.avatarUrl!)
              : null,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  WidgetSpan(child: SizedBox(width: 4)),
                  TextSpan(
                    text: '@${note.creator.userTag}',
                    style: TextStyles.light1,
                  ),
                ]
              )
            ),
            Text(
              '${note.creationDate}',
              style: TextStyles.light2
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.more_horiz),
            ),
          )
        )
      ],
    );
  }
}

class _LikeButton extends StatefulWidget {
  final void Function(bool isLiked) onChanged;
  final bool isLiked;
  final int likeCount;

  const _LikeButton({
    Key? key,
    required this.onChanged,
    required this.likeCount,
    required this.isLiked,
  }) : super(key: key);

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  late bool _isLiked;
  late int _likeCount;

  @override
  void initState() {
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;

          if (_isLiked) {
            _likeCount++;
          } else {
            _likeCount--;
          }

          widget.onChanged(_isLiked);
        });
      },
      icon: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 16,
            color: _isLiked
              ? Theme.of(context).primaryColor
              : Colors.black.withOpacity(0.6),
          ),
          SizedBox(width: 8),
          Text(
            '$_likeCount',
            style: TextStyle(
              color: _isLiked
                  ? Theme.of(context).primaryColor
                  : Colors.black.withOpacity(0.6)
            ),
          ),
        ],
      ),
    );
  }
}

