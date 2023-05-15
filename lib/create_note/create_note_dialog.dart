import 'dart:math';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/profile/widgets/avatar_profile_image.dart';
import 'package:selfdevers/profile/widgets/user_circle_avatar.dart';
import 'package:selfdevers/utils/my_special_text_span_builder.dart';
import 'package:selfdevers/utils/todo_editing_controller.dart';

import '../../widgets/popup_menu_tile.dart';

Future<void> showCreateNoteDialog(BuildContext context) async {
  await Navigator.push(context, PageRouteBuilder(
      fullscreenDialog: true,
      opaque: false,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      pageBuilder: (context, _, __) => CreateNoteScreen(),
      // builder: (context) => CreateNoteScreen(),
  ));
}



// Можно все richTextController'ы и FocusNod'ы перекинуть в Provider'ы,
// т.к. тут тоже есть методы dispose.
// Но это будет, конечно, запутанная схема.

final canSendNoteProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final canAddEmptyNoteProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// TODO: Может переделать всё на provider'ы?


class CreateNoteScreen extends ConsumerStatefulWidget {

  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  // final TextEditingController _textEditingController = TextEditingController();
  // final FocusNode _textFocusNode = FocusNode();
  // final FocusNode _textFocusNode2 = FocusNode();
  // final FocusNode _textFocusNode3 = FocusNode();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _addEmptyNoteAt(0);
    });
  }

  final List<_CreateNoteViewDto> _createNoteViewDtos = [];
  // late final Map<UniqueKey, _CreateNoteViewDto> _createNoteViewDtos;

  int? _focusedNoteIndex;

  void _onNoteContentChanged() {

  }

  void _addEmptyNoteAt(int index) {
    final key = UniqueKey();

    final focusNode = FocusNode();
    focusNode.addListener(_onNoteFocusChanged);
    focusNode.requestFocus();

    final richTextController = RichTextController(
        patternMatchMap: {
          // TODO: Возникает ошибка, что нельзя использовать Theme.of(context) в initState
          RegExp(r"\B@[a-zA-Z0-9_]+\b"): TextStyle(color: Theme.of(context).primaryColor),
        },
        onMatch: (List<String> matches) {},
        onMatchIndex: (List<Map<String, List<int>>> matches) {
          findNoteDtoByKey(key).matches = matches;
        });
    richTextController.addListener(() {
        final createNoteViewDto = findNoteDtoByKey(key);

        final selectionStart = richTextController.selection.start;
        final selectionEnd = richTextController.selection.end;

        // TODO: Нужно будет показывать список пользователей по matchedText
        final matchedText = createNoteViewDto.matches.firstWhereOrNull((match) {
          bool hasMatchedTextInSelection = false;

          match.forEach((text, indexes) {
            int matchStart = indexes[0];
            int matchEnd = indexes[1];

            // Если курсор находится в пределах мэтча специальных слов
            // при создании поста. Например, упоминаний "@name".
            if (!(selectionStart > matchEnd + 1 ||
                matchStart - 1 > selectionEnd)) {
              hasMatchedTextInSelection = true;
            }
          });

          return hasMatchedTextInSelection;
        });
        _recalculateCanAddEmptyNote();
    });

    _createNoteViewDtos.insert(
        index,
        _CreateNoteViewDto(
          key: key,
          hintText: 'Напишите что-нибудь',
          richTextController: richTextController,
          focusNode: focusNode,
          showLineToNextNote: false,
        ),
    );

    _recalculateCanAddEmptyNote();
    _recalculateThreadLines();
  }

  void _onNoteFocusChanged() {
    final newFocusedNoteIndex = _createNoteViewDtos.indexWhere((dto) => dto.focusNode.hasFocus);
    if (newFocusedNoteIndex != -1) {
      _focusedNoteIndex = newFocusedNoteIndex;
    }

    // Setting opacity for every note
    setState(() {
      for(int i = 0; i < _createNoteViewDtos.length; i++) {
        final dto = _createNoteViewDtos[i];
        if (i == _focusedNoteIndex) {
          dto.opacity = 1;
        } else {
          dto.opacity = 0.6;
        }
      }
    });
    _recalculateCanAddEmptyNote();
  }

  Future<void> _recalculateCanAddEmptyNote() async {
    final bool canAddEmptyNote;
    if (_focusedNoteIndex == null) {
      canAddEmptyNote = false;
    } else {
      canAddEmptyNote = _createNoteViewDtos[_focusedNoteIndex!].isNoteNotEmpty();
    }

    ref.read(canAddEmptyNoteProvider.notifier).state = canAddEmptyNote;
  }

  void _recalculateThreadLines() {
    for (int i = 0; i < _createNoteViewDtos.length; i++) {
      bool isLastNote = i == _createNoteViewDtos.length-1;
      _createNoteViewDtos[i].showLineToNextNote = !isLastNote;
    }
    setState(() {});
  }

  void _deleteNoteAt(int index) {
    final removedNoteViewDto = _createNoteViewDtos.removeAt(index);
    removedNoteViewDto.dispose();

    if (index == _focusedNoteIndex) {
      _createNoteViewDtos[index - 1].focusNode.requestFocus();
    }

    _recalculateThreadLines();
  }

  _CreateNoteViewDto findNoteDtoByKey(UniqueKey key) {
    return _createNoteViewDtos.firstWhere((dto) => dto.key == key);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // if (constraints.maxWidth > 550) {
        //   return Center(
        //     child: SingleChildScrollView(
        //       child: SizedBox(
        //         height: 500,
        //         width: 500,
        //         child: Column(
        //           children: [
        //             AppBar(
        //               title: Text('Создание поста'),
        //             ),
        //             Expanded(
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.black,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   );
        // }

        return Scaffold(
          appBar: AppBar(
            title: Text('Создание поста'),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: List.generate(_createNoteViewDtos.length, (index) {
                        final dto = _createNoteViewDtos[index];
                        final canBeDeleted = index != 0;

                        return Opacity(
                          opacity: dto.opacity,
                          child: _CreateNoteView(
                            key: dto.key,
                            hintText: dto.hintText,
                            focusNode: dto.focusNode,
                            textEditingController: dto.richTextController,
                            showLineToNextNote: dto.showLineToNextNote,
                            // onContentChanged: (String text, List<String> images) {
                            //   // TODO: Чтобы этот контент хранился в
                            // }
                            deleteButton: canBeDeleted
                                ? _DeleteNoteButton(
                                    onPressed: () => _deleteNoteAt(index),
                                  )
                                : null,
                            imageProviders: dto.imagePaths.map<ImageProvider>((path) {
                              if (kIsWeb) {
                                return NetworkImage(path);
                              } else {
                                return AssetImage(path);
                              }
                            }).toList(),
                            // onDelete: () {
                            //   _deleteNoteByKey(dto.key);
                            // },
                          ),
                        );
                      })..add(MouseRegion(
                        cursor: SystemMouseCursors.text,
                        child: GestureDetector(
                          onTap: () {
                            _createNoteViewDtos.last.focusNode.requestFocus();
                          },
                          child: Container(
                            height: constraints.maxHeight,
                            width: double.infinity,
                            color: Colors.transparent,
                          ),
                        ),
                      )),
                      // children: [
                        // TODO: Нужно как-то узнавать содержимое каждой
                        // заметки, чтобы потом разом всё сохранить,
                        // а так же чтобы правильно отображать кнопки
                        // "Опубликовать" и "Добавить в черновик".
                        // TODO 2: Нужно упралять opacity в зависимости от
                        // focusNode в этом виджете.
                        // Для этого можно создать какой-нибудь класс
                        // createNoteViewDto, где будут размещаться
                        // TextEditingController, focusNode и значение opacity

                        // _CreateNoteView(
                        //   textEditingController: TextEditingController(),
                        //   focusNode: _textFocusNode2,
                        //   hintText: 'Напишите ещё одну заметку',
                        //   showLineToNextNote: true,
                        // ),
                        // _CreateNoteView(
                        //   textEditingController: ,
                        //   focusNode: _textFocusNode3,
                        //   hintText: 'Напишите ещё одну заметку',
                        // ),
                      // ],
                    ),
                  ),
                ),
              ),
              _BottomEditingBar(
                actions: [
                  IconButton(
                    // TODO: Сделать, чтобы нельзя было добавлять больше 4-х изображений
                    // if (_focusedNoteIndex != null && _createNoteViewDtos[_focusNoteIndex].imagePaths <= 3
                    onPressed: (_focusedNoteIndex != null)
                        ? () async {
                            var imageFiles = await ImagePicker().pickMultiImage();
                            if (imageFiles.length > 4) {
                              imageFiles = imageFiles.sublist(0, 3);
                            }

                            setState(() {
                              _createNoteViewDtos[_focusedNoteIndex!].imagePaths =
                                  imageFiles.map((e) => e.path).toList();
                            });
                          }
                        : null,
                    icon: Icon(Icons.photo),
                  ),
                ],
                addNoteButton: Consumer(
                  builder: (context, ref, _) {
                    final canAdd = ref.watch(canAddEmptyNoteProvider);

                    print('canAdd: $canAdd');

                    if (canAdd) {
                      return _AddEmptyNoteButton(
                        onAddPressed: () {
                          _addEmptyNoteAt(_focusedNoteIndex! + 1);
                        },
                      );
                    }

                    return SizedBox();
                  }
                ),
                publishButton: Consumer(
                  builder: (context, ref, _) {
                    final canSend = ref.watch(canSendNoteProvider);

                    return FilledButton(
                      onPressed: canSend
                          ? () {}
                          : null,
                      child: Text('Опубликовать'),
                    );
                  }
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DeleteNoteButton extends StatelessWidget {
  final void Function()? onPressed;

  const _DeleteNoteButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.close),
      iconSize: 20,
      color: Theme.of(context).primaryColor,
    );
  }
}


class _AddEmptyNoteButton extends ConsumerWidget {
  final void Function() onAddPressed;

  const _AddEmptyNoteButton({
    Key? key,
    required this.onAddPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      focusNode: FocusNode()..addListener(() {
        print('BUTTON FOCUS NODE WORKED');
      }),
      onPressed: onAddPressed,
      icon: Icon(Icons.add),
      color: Theme.of(context).primaryColor,
    );
  }
}

class _CreateNoteViewDto {
  final UniqueKey key;
  final String hintText;
  final RichTextController richTextController;
  final FocusNode focusNode;
  bool showLineToNextNote;
  List<String> imagePaths;
  double opacity;
  List<Map<String, List<int>>> matches;

  _CreateNoteViewDto({
    required this.key,
    required this.hintText,
    required this.richTextController,
    required this.focusNode,
    this.showLineToNextNote = false,
    this.imagePaths = const [],
    this.opacity = 1,
    this.matches = const [],
  });

  bool isNoteEmpty() {
    if (richTextController.text.trim().isEmpty && imagePaths.isEmpty) {
      return true;
    }

    return false;
  }

  bool isNoteNotEmpty() => !isNoteEmpty();

  void dispose() {
    richTextController.dispose();
    focusNode.dispose();
  }
}

// class _CreateNoteViewContent {
//   final List<String> imagePaths;
//   final String text;
//   final List<String> soundPaths;
//
//   bool canBeSent() {
//     if (text.trim().isEmpty && imagePaths.isEmpty && soundPaths.isEmpty) {
//       return false;
//     }
//
//     // TODO: Приклеплённые челленжи будут через ## или как отдельный ChallengeTile?
//   }
// }

class _CreateNoteView extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool showLineToNextNote;
  final FocusNode focusNode;
  final _DeleteNoteButton? deleteButton;
  final List<ImageProvider> imageProviders;

  const _CreateNoteView({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.showLineToNextNote = false,
    required this.focusNode,
    this.deleteButton,
    this.imageProviders = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatarRadius = 20.0;
    final bottomLineWidth = 2.0;
    final bottomLineLeftPadding = avatarRadius - bottomLineWidth / 2.0;

    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            CircleUserAvatar(
                              radius: avatarRadius,
                            ),
                            if (showLineToNextNote)
                              Expanded(
                                child: Container(
                                  color: theme.primaryColor,
                                  width: bottomLineWidth,
                                ),
                              ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  focusNode: focusNode,
                                  controller: textEditingController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Напишите что-нибудь',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                    suffixIcon: Opacity(
                                      opacity: 0,
                                      child: _DeleteNoteButton(onPressed: null)
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  textCapitalization: TextCapitalization.sentences,
                                  maxLength: 500,
                                ),
                                _buildImages(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // if (deleteButton != null)
                //   deleteButton!,
              ],
            ),
          ),
          if (deleteButton != null)
            Positioned(
              top: 0,
              right: 0,
              child: deleteButton!,
            ),
        ],
      ),
    );
  }

  Widget _buildImages() {
    if (imageProviders.isEmpty) {
      return const SizedBox();
    }

    final List<ImageProvider> leftImageProviders;
    final List<ImageProvider> rightImageProviders;

    if (imageProviders.length == 4) {
      leftImageProviders = imageProviders.sublist(0, 1);
    } else {
      leftImageProviders = imageProviders.sublist(0, 0);
    }

    // if (imageProviders.length >= 3) {
    //   rightImageProviders = imageProviders.sublist(start)
    // }

    const spaceBetween = 8.0;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: _CreateNoteImageView(imageProvider: imageProviders[0])
                ),
                if (imageProviders.length == 4)
                  const SizedBox(height: spaceBetween),
                if (imageProviders.length == 4)
                  Expanded(
                    child: _CreateNoteImageView(imageProvider: imageProviders[2])
                  ),
              ],
            )
          ),
          if (imageProviders.length > 1)
            const SizedBox(width: spaceBetween),
          if (imageProviders.length > 1)
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _CreateNoteImageView(imageProvider: imageProviders[1])
                  ),
                  if (imageProviders.length == 3 || imageProviders.length == 4)
                    const SizedBox(height: spaceBetween),
                  if (imageProviders.length == 3)
                    Expanded(
                      child: _CreateNoteImageView(imageProvider: imageProviders[2])
                    ),
                  if (imageProviders.length == 4)
                    Expanded(
                      child: _CreateNoteImageView(imageProvider: imageProviders[3])
                    ),
                ],
              )
            ),
        ],
      ),
    );
  }
}

class _CreateNoteImageView extends StatelessWidget {
  final ImageProvider imageProvider;

  const _CreateNoteImageView({
    Key? key,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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


class _BottomEditingBar extends StatelessWidget {
  final List<Widget> actions;
  final Widget addNoteButton;
  final Widget publishButton;

  const _BottomEditingBar({
    Key? key,
    required this.actions,
    required this.addNoteButton,
    required this.publishButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: Colors.black38,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: actions,
                    ),
                  ),
                ),
                addNoteButton,
                SizedBox(width: 8),
                publishButton,
              ]
            ),
          ),
        ],
      ),
    );
  }
}

