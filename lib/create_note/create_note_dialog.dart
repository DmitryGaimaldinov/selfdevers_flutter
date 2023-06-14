import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/create_note/create_note_notifier.dart';
import 'package:selfdevers/create_note/models/send_note_dto.dart';
import 'package:selfdevers/create_note/widgets/quoted_note_view.dart';
import 'package:selfdevers/feed/widgets/note_image_view.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/utils/photo_utils.dart';
import 'package:selfdevers/widgets/button_progress_indicator.dart';
import 'package:selfdevers/widgets/my_divider.dart';
import 'package:selfdevers/widgets/neon_icon_button.dart';
import 'package:selfdevers/widgets/neon_outlined_button.dart';
import 'package:selfdevers/widgets/show_adaptive_dialog.dart';
import 'package:path/path.dart' as path;

// Returns true if note is created. False if note
Future<bool> showCreateNoteDialog(BuildContext context,
        {NoteDto? quotedNoteDto, NoteDto? parentNoteDto}) async {
  final isNoteCreated = await showAdaptiveDialog<bool?>(
        context: context,
        screen: CreateNoteScreen(
            quotedNoteDto: quotedNoteDto, parentNoteDto: parentNoteDto));

  if (isNoteCreated == true) {
    return true;
  }

  return false;
}

final _canSendNoteProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final _canAddEmptyNoteProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final _textLengthProvider = StateProvider.autoDispose<int?>((ref) {
  return null;
});

final _canAddToDraftProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class CreateNoteScreen extends ConsumerStatefulWidget {
  final NoteDto? quotedNoteDto;
  final NoteDto? parentNoteDto;

  const CreateNoteScreen({
    Key? key,
    this.quotedNoteDto,
    this.parentNoteDto,
  }) : super(key: key);

  @override
  ConsumerState<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  final List<_DraftNoteViewDto> _draftNoteViewDtos = [];
  int? _selectedNoteIndex;

  @override
  void initState() {
    super.initState();
    print(
        'create note screen init state. widget.quotedNoteDto ${widget.quotedNoteDto}');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _addEmptyNoteAt(0);
    });
  }

  Future<void> _send() async {
    try {
      await ref.read(createNoteStateProvider.notifier).send(
          sendNoteDtos: List.generate(_draftNoteViewDtos.length, (index) {
            final draftNoteViewDto = _draftNoteViewDtos[index];
            int? parentNoteId;
            if (index == 0 && widget.parentNoteDto != null) {
              parentNoteId = widget.parentNoteDto!.id;
            }

            return SendNoteDto(
              parentNoteId: parentNoteId,
              text: draftNoteViewDto.richTextController.text,
              imageXFiles: draftNoteViewDto.imageXFiles,
              quotedNoteId: draftNoteViewDto.quotedNoteDto?.id,
            );
          }),
      );
      if (mounted) {
        Fluttertoast.showToast(msg: 'Посты отправлены!');
        Navigator.pop(context, true);
      }
    } catch (e) {
      rethrow;
    }
  }

  void _addEmptyNoteAt(int index) {
    final key = UniqueKey();

    final focusNode = FocusNode();
    focusNode.addListener(_onNoteFocusChanged);
    focusNode.requestFocus();

    final richTextController = RichTextController(
        patternMatchMap: {
          // TODO: Возникает ошибка, что нельзя использовать Theme.of(context) в initState
          RegExp(r"\B@[a-zA-Z0-9_]+\b"):
              TextStyle(color: Theme.of(context).primaryColor),
        },
        onMatch: (List<String> matches) {},
        onMatchIndex: (List<Map<String, List<int>>> matches) {
          _findNoteDtoByKey(key).matches = matches;
        });
    richTextController.addListener(() => _onNoteContentChanged(key));
    _draftNoteViewDtos.insert(
      index,
      _DraftNoteViewDto(
        key: key,
        richTextController: richTextController,
        focusNode: focusNode,
        quotedNoteDto: (index == 0) ? widget.quotedNoteDto : null,
      ),
    );

    _recalculateSelectedNoteLength();
    _recalculateCanAddEmptyNote();
    _recalculateThreadLines();
  }

  void _onNoteFocusChanged() {
    final newFocusedNoteIndex =
        _draftNoteViewDtos.indexWhere((dto) => dto.focusNode.hasFocus);
    if (newFocusedNoteIndex != -1) {
      _selectedNoteIndex = newFocusedNoteIndex;
    }

    _recalculateCanAddEmptyNote();
    _recalculateSelectedNoteLength();

    setState(() {});
  }

  void _onNoteContentChanged(UniqueKey key) {
    final draftNoteDto = _findNoteDtoByKey(key);

    final textController = draftNoteDto.richTextController;

    final selectionStart = textController.selection.start;
    final selectionEnd = textController.selection.end;

    String? matchedText;
    for (var match in draftNoteDto.matches) {
      match.forEach((text, indexes) {
        int matchStart = indexes[0];
        int matchEnd = indexes[1];

        // Если курсор находится в пределах мэтча специальных слов
        // при создании поста. Например, упоминаний "@name".
        if (!(selectionStart > matchEnd + 1 || matchStart - 1 > selectionEnd)) {
          if (matchedText != null) {
            matchedText = text;
          }
        }
      });

      // Если нашли первое слово, которое начинается со специального знака,
      // прекращаем искать специальные слова
      if (matchedText != null) {
        break;
      }
    }

    // TODO: Показывать список пользователей по matchedText
    if (matchedText != null) {}

    _recalculateSelectedNoteLength();
    _recalculateCanAddEmptyNote();
    _recalculateCanSendNote();
    _recalculateCanAddToDraft();
  }

  void _recalculateCanSendNote() {
    ref.read(_canSendNoteProvider.notifier).state = _draftNoteViewDtos
        .every((draftNoteDto) => draftNoteDto.isNoteNotEmpty());
  }

  void _recalculateSelectedNoteLength() {
    debugPrint(
        'Создание поста. Обновление длины текущего поста: ${_selectedNoteDto?.richTextController.text.length}');
    ref.read(_textLengthProvider.notifier).state =
        _selectedNoteDto?.richTextController.text.length;
  }

  Future<void> _recalculateCanAddEmptyNote() async {
    final bool canAddEmptyNote;
    if (_selectedNoteIndex == null) {
      canAddEmptyNote = false;
    } else {
      canAddEmptyNote =
          _draftNoteViewDtos[_selectedNoteIndex!].isNoteNotEmpty();
    }

    ref.read(_canAddEmptyNoteProvider.notifier).state = canAddEmptyNote;
  }

  void _recalculateThreadLines() {
    setState(() {});
  }

  void _recalculateCanAddToDraft() {
    ref.read(_canAddToDraftProvider.notifier).state =
        _draftNoteViewDtos.any((dto) => dto.isNoteNotEmpty());
  }

  void _deleteNoteAt(int index) {
    if (index == _selectedNoteIndex) {
      _draftNoteViewDtos[index - 1].focusNode.requestFocus();
    }

    if (_selectedNoteIndex == _draftNoteViewDtos.length - 1) {
      _draftNoteViewDtos[_draftNoteViewDtos.length - 1]
          .focusNode
          .requestFocus();
    }

    final removedNoteViewDto = _draftNoteViewDtos.removeAt(index);
    removedNoteViewDto.dispose();
    _recalculateThreadLines();
    _recalculateCanSendNote();
  }

  _DraftNoteViewDto _findNoteDtoByKey(UniqueKey key) {
    return _draftNoteViewDtos.firstWhere((dto) => dto.key == key);
  }

  _DraftNoteViewDto? get _selectedNoteDto {
    if (_selectedNoteIndex == null ||
        _selectedNoteIndex! >= _draftNoteViewDtos.length) {
      return null;
    }

    return _draftNoteViewDtos[_selectedNoteIndex!];
  }

  @override
  Widget build(BuildContext context) {
    final createNoteState = ref.watch(createNoteStateProvider);
    final isSending = createNoteState.isSending;

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Создание поста'),
        actions: [
          // Черновик
          // Consumer(
          //   builder: (context, ref, child) {
          //     final canAddToDraft = ref.watch(_canAddToDraftProvider);
          //
          //     if (canAddToDraft) {
          //       return TextButton(
          //         onPressed: () {},
          //         child: Text('В черновик')
          //       );
          //     }
          //
          //     return const SizedBox();
          //   },
          // ),
          // SizedBox(width: 16),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            if (isSending) LinearProgressIndicator(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      if (widget.parentNoteDto != null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            QuotedNoteView(note: widget.parentNoteDto!),
                            SizedBox(height: 16),
                            MyDivider(),
                            SizedBox(height: 16),
                          ],
                        ),
                      ...List.generate(_draftNoteViewDtos.length, (index) {
                        final dto = _draftNoteViewDtos[index];
                        final canBeDeleted = (index != 0) && !isSending;

                        final isLastNote =
                            (index == _draftNoteViewDtos.length - 1);

                        // final NoteDto? quotedNoteDto =
                        //     (index == 0) ? widget.quotedNoteDto : null;

                        return Opacity(
                          opacity: (index == _selectedNoteIndex && !isSending)
                              ? 1
                              : 0.6,
                          child: _DraftNoteView(
                            key: dto.key,
                            hintText: (index == 0)
                                ? 'Напишите что-нибудь'
                                : 'Напишите ещё что-нибудь',
                            focusNode: dto.focusNode,
                            textEditingController: dto.richTextController,
                            showLineToNextNote: !isLastNote,
                            deleteButton: canBeDeleted
                                ? _DeleteNoteButton(
                                    onPressed: () => _deleteNoteAt(index),
                                  )
                                : null,
                            imageProviders:
                                dto.imageXFiles.map<ImageProvider>((xFile) {
                              if (kIsWeb) {
                                return NetworkImage(xFile.path);
                              } else {
                                return AssetImage(xFile.path);
                              }
                            }).toList(),
                            onImageDeleted: (int imageIndex) {
                              setState(() {
                                dto.imageXFiles.removeAt(imageIndex);
                              });
                            },
                            quotedNoteDto: dto.quotedNoteDto,
                          ),
                        );
                      }),
                      MouseRegion(
                        cursor: SystemMouseCursors.text,
                        child: GestureDetector(
                          onTap: () {
                            _draftNoteViewDtos.last.focusNode.requestFocus();
                          },
                          child: Container(
                            height: constraints.maxHeight,
                            width: double.infinity,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _BottomEditingBar(
                actions: [
                  NeonIconButton(
                    onPressed: (_selectedNoteDto != null &&
                            _selectedNoteDto!.imageXFiles.length < 4 &&
                            !isSending)
                        ? () async {
                            // Текущие изображения в посте
                            final selectedNoteDto = _selectedNoteDto!;
                            var imageXFiles = selectedNoteDto.imageXFiles;

                            // Выбираем ещё изображения
                            List<XFile> pickedImageXFiles =
                                await ImagePicker().pickMultiImage();

                            // Проверяем расширения изображений
                            bool pickedWrongExtension =
                                pickedImageXFiles.any((xFile) {
                              final extension = path.extension(xFile.name);
                              return !PhotoUtils.isSupportedExtension(
                                  extension);
                            });
                            // Если есть неподдерживаемые, убираем такие изображения
                            if (pickedWrongExtension) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Выбрано изображение с неразрешённым расширением');
                              pickedImageXFiles.removeWhere((xFile) =>
                                  !PhotoUtils.isSupportedExtension(
                                      path.extension(xFile.name)));
                            }

                            imageXFiles = [
                              ...imageXFiles,
                              ...pickedImageXFiles
                            ];

                            if (imageXFiles.length > 4) {
                              imageXFiles = imageXFiles.sublist(0, 4);
                              Fluttertoast.showToast(
                                  msg: 'Нельзя добавить больше 4 изображений');
                            }

                            setState(() {
                              _draftNoteViewDtos[_selectedNoteIndex!]
                                  .imageXFiles = imageXFiles;
                            });
                            _onNoteContentChanged(selectedNoteDto.key);
                          }
                        : null,
                    icon: Icon(Icons.photo),
                  ),
                ],
                addNoteButton: Consumer(builder: (context, ref, _) {
                  final canAdd =
                      ref.watch(_canAddEmptyNoteProvider) && !isSending;

                  if (canAdd) {
                    return _AddEmptyNoteButton(
                        onPressed: () =>
                            _addEmptyNoteAt(_selectedNoteIndex! + 1));
                  }

                  return SizedBox();
                }),
                publishButton: Consumer(builder: (context, ref, _) {
                  final canSend = ref.watch(_canSendNoteProvider) && !isSending;

                  return NeonOutlinedButton(
                    onPressed: canSend ? _send : null,
                    // child: createNoteState.isSending
                    //     ? const ButtonProgressIndicator()
                    //     : Text('Опубликовать'),
                    child: Text('Опубликовать'),
                  );
                }),
                lengthCounterView: Consumer(
                  builder: (context, ref, _) {
                    final length = ref.watch(_textLengthProvider);

                    if (length == null) {
                      return const SizedBox();
                    }

                    return Text(
                      '$length/500',
                      style: Theme.of(context).textTheme.labelMedium,
                    );
                  },
                )),
          ],
        );
      }),
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
    return NeonIconButton(
      onPressed: onPressed,
      icon: Icon(Icons.close, size: 20),
      // color: Theme.of(context).primaryColor,
    );
  }
}

class _AddEmptyNoteButton extends ConsumerWidget {
  final void Function()? onPressed;

  const _AddEmptyNoteButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeonIconButton(
      onPressed: onPressed,
      icon: Icon(Icons.add),
    );
  }
}

class _DraftNoteViewDto {
  final UniqueKey key;
  final RichTextController richTextController;
  final FocusNode focusNode;
  List<XFile> imageXFiles;
  List<Map<String, List<int>>> matches;
  NoteDto? quotedNoteDto;

  _DraftNoteViewDto({
    required this.key,
    required this.richTextController,
    required this.focusNode,
    this.imageXFiles = const [],
    this.matches = const [],
    this.quotedNoteDto,
  });

  bool isNoteEmpty() {
    if (richTextController.text.trim().isEmpty &&
        imageXFiles.isEmpty &&
        quotedNoteDto == null) {
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

class _DraftNoteView extends ConsumerWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool showLineToNextNote;
  final FocusNode focusNode;
  final _DeleteNoteButton? deleteButton;
  final List<ImageProvider> imageProviders;
  final void Function(int imageIndex) onImageDeleted;
  final NoteDto? quotedNoteDto;

  const _DraftNoteView({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.showLineToNextNote = false,
    required this.focusNode,
    this.deleteButton,
    this.imageProviders = const [],
    required this.onImageDeleted,
    this.quotedNoteDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarRadius = 20.0;
    final bottomLineWidth = 2.0;

    final theme = Theme.of(context);

    print('build draft note view. quotedNoteDto: $quotedNoteDto');

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
                            UserAvatar(
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
                                  enabled: !ref
                                      .watch(createNoteStateProvider)
                                      .isSending,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Напишите что-нибудь',
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 16),
                                    suffixIcon: Opacity(
                                        opacity: 0,
                                        child:
                                            _DeleteNoteButton(onPressed: null)),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  maxLength: 500,
                                  buildCounter: (
                                    BuildContext context, {
                                    required int currentLength,
                                    required int? maxLength,
                                    required bool isFocused,
                                  }) {
                                    return null;
                                  },
                                ),
                                _buildImages(ref),
                                // SizedBox(height: 16),
                                if (quotedNoteDto != null)
                                  QuotedNoteView(note: quotedNoteDto!),
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

  Widget _buildImages(WidgetRef ref) {
    final createNoteState = ref.watch(createNoteStateProvider).isSending;

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

    const spaceBetween = 8.0;

    // final isSending = ref.watch(isSend)

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: _DraftNoteImageView(
                  imageProvider: imageProviders[0],
                  onDeletePressed: () => onImageDeleted(0),
                )),
                if (imageProviders.length == 4)
                  const SizedBox(height: spaceBetween),
                if (imageProviders.length == 4)
                  Expanded(
                      child: _DraftNoteImageView(
                    imageProvider: imageProviders[2],
                    onDeletePressed: () => onImageDeleted(2),
                  )),
              ],
            )),
            if (imageProviders.length > 1) const SizedBox(width: spaceBetween),
            if (imageProviders.length > 1)
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: _DraftNoteImageView(
                    imageProvider: imageProviders[1],
                    onDeletePressed: () => onImageDeleted(1),
                  )),
                  if (imageProviders.length == 3 || imageProviders.length == 4)
                    const SizedBox(height: spaceBetween),
                  if (imageProviders.length == 3)
                    Expanded(
                        child: _DraftNoteImageView(
                      imageProvider: imageProviders[2],
                      onDeletePressed: () => onImageDeleted(2),
                    )),
                  if (imageProviders.length == 4)
                    Expanded(
                        child: _DraftNoteImageView(
                      imageProvider: imageProviders[3],
                      onDeletePressed: () => onImageDeleted(3),
                    )),
                ],
              )),
          ],
        ),
      ),
    );
  }
}

class _DraftNoteImageView extends StatelessWidget {
  final ImageProvider imageProvider;
  final void Function() onDeletePressed;

  const _DraftNoteImageView({
    Key? key,
    required this.onDeletePressed,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NoteImageView(imageProvider: imageProvider),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            onPressed: onDeletePressed,
            icon: Icon(Icons.close),
            color: Colors.white,
            style: IconButton.styleFrom(
              backgroundColor: Colors.black,
              fixedSize: const Size(32, 32),
              maximumSize: const Size(32, 32),
              minimumSize: const Size(32, 32),
            ),
            iconSize: 16,
          ),
        ),
      ],
    );
  }
}

class _BottomEditingBar extends ConsumerWidget {
  final List<Widget> actions;
  final Widget addNoteButton;
  final Widget publishButton;
  final Widget? lengthCounterView;

  const _BottomEditingBar({
    Key? key,
    required this.actions,
    required this.addNoteButton,
    required this.publishButton,
    required this.lengthCounterView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyDivider(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    children: actions,
                  ),
                ),
              ),
              if (lengthCounterView != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: lengthCounterView!,
                ),
              // addNoteButton,
              // SizedBox(width: 8),
              publishButton,
            ]),
          ),
        ],
      ),
    );
  }
}
