import 'dart:io';
import 'dart:ui';

import 'package:crop_image/crop_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/edit_profile/edit_profile_notifier.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/screens/crop_image_screen.dart';
import 'package:selfdevers/profile/pick_and_crop_image.dart';
import 'package:selfdevers/utils/no_whitespaces_text_input_formatter.dart';

import '../api/status_codes.dart';
import '../api/users/dto/user_dto.dart';
import '../profile/user.dart';
import '../profile/widgets/avatar_profile_image.dart';
import '../profile/widgets/background_profile_image.dart';
import 'edit_profile_state.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final UserDto user;

  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  // PickAndCropImageResult? _pickedBackgroundImageData;
  // PickAndCropImageResult? _pickedAvatarImageData;
  //
  // Uint8List? get _backgroundImageBytes => _pickedBackgroundImageData?.imageBytes;
  // Uint8List? get _avatarImageBytes => _pickedAvatarImageData?.imageBytes;
  //
  // String? get _backgroundImageName => _pickedBackgroundImageData?.filename;
  // String? get _avatarImageName => _pickedAvatarImageData?.filename;

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _tagController;
  // late bool _isPrivate;

  EditProfileNotifier get editProfileNotifier =>
      ref.read(editProfileNotifierProvider(widget.user).notifier);

  @override
  initState() {
    // ref.read(_nameProvider.notifier).state = widget.user.name;
    // ref.read(_descriptionProvider.notifier).state = widget.user.description;
    // ref.read(_tagProvider.notifier).state = widget.user.userTag;

    _nameController = TextEditingController(text: widget.user.name)
        ..addListener(() {
            editProfileNotifier.nameChanged(_nameController.text);
        });
    _descriptionController = TextEditingController(text: widget.user.description)
        ..addListener(() {
            editProfileNotifier.descriptionChanged(_descriptionController.text);
        });
    _tagController = TextEditingController(text: widget.user.userTag)
        ..addListener(() {
            editProfileNotifier.tagChanged(_tagController.text);
        });
    // _isPrivate = widget.user.isPrivate;
    super.initState();
  }

  @override
  dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    // Сохраняем аватарку.
    // TODO: При сохранении аватарки возвращается url.
    // Нужно этот url сохранить в widget.user и
    // currentUserProvider
    // if (_pickedAvatarImageData != null) {
    //   final response = await ref.read(apiProvider).post(
    //     ApiServices.updateAvatar,
    //     FormData.fromMap({
    //       'file': MultipartFile.fromBytes(
    //         _avatarImageBytes!,
    //         filename: _avatarImageName,
    //       )
    //     }),
    //   );
    //   if (response.statusCode == StatusCodes.created) {
    //     print('response.data[imageUrl]: ${response.data['imageUrl']}');
    //     widget.user.avatarUrl = response.data['imageUrl'];
    //   }
    // }
    //
    // Сохраняем задний фон
    // if (_pickedBackgroundImageData != null) {
    //   final response = await ref.read(apiProvider).post(
    //     ApiServices.updateBackground,
    //     FormData.fromMap({
    //       'file': MultipartFile.fromBytes(
    //         _backgroundImageBytes!,
    //         filename: _backgroundImageName,
    //       )
    //     }),
    //   );
    //   if (response.statusCode == StatusCodes.created) {
    //     print('response.data[imageUrl]: ${response.data['imageUrl']}');
    //     widget.user.backgroundUrl = response.data['imageUrl'];
    //   }
    // }
    //
    // Сохраняем остальные изменения
    //
    //
    //
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Всё оптимизировать. Разбить на отдельные виджеты
    // и использовать select

    final editProfileState = ref.watch(editProfileNotifierProvider(widget.user));
    if (editProfileState.saveState == EditProfileSaveState.saved) {
      Navigator.of(context).pop();
    }

    print('editProfileState reloaded: ${editProfileState}');
    print('canSave: ${editProfileState.canSave}');

    ImageProvider? avatarImageProvider = editProfileState.avatarImageProvider;
    ImageProvider? backgroundImageProvider = editProfileState.backgroundImageProvider;

    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить профиль'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: editProfileState.saveState == EditProfileSaveState.savingInProgress
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: editProfileState.canSave
                        ? () {
                      editProfileNotifier.save();
                    }
                        : null,
                    child: Text('Сохранить'),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: CenterConstrained(
          child: LayoutBuilder(
              builder: (context, constraints) {
                final backgroundHeight = constraints.maxWidth / 3;
                final totalHeaderHeight = backgroundHeight + 40;

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16.0),
                    )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: totalHeaderHeight,
                            color: Colors.transparent,
                          ),
                          PopupMenuButton(
                            tooltip: 'Сменить задний фон',
                            position: PopupMenuPosition.under,
                            offset: Offset(24, 0),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem<int>(
                                  value: 0,
                                  onTap: () async {
                                    final croppedImageData = await pickAndCropImage(
                                        context: context,
                                        imageSource: ImageSource.gallery,
                                        aspectRatio: 3 / 1
                                    );
                                    if (croppedImageData != null) {
                                      editProfileNotifier.setBackground(croppedImageData);
                                    }
                                  },
                                  child: ListTile(
                                    title: const Text('Новое фото'),
                                  )),
                              if (editProfileState.canRestoreBackground)
                                PopupMenuItem<int>(
                                    value: 1,
                                    onTap: () {
                                      editProfileNotifier.restoreOldBackground();
                                    },
                                    child: ListTile(
                                      title: const Text('Вернуть старое фото'),
                                    )),
                              if (editProfileState.canDeleteBackground)
                                PopupMenuItem<int>(
                                    value: 1,
                                    onTap: () {
                                      editProfileNotifier.deleteBackground();
                                    },
                                    child: ListTile(
                                      title: const Text('Удалить фото'),
                                    )),
                            ],
                            child: Stack(
                              children: [
                                BackgroundProfileImage(
                                  height: backgroundHeight,
                                  imageProvider: backgroundImageProvider,
                                ),
                                Positioned.fill(
                                  child: Container(
                                    width: 76,
                                    height: 76,
                                    color: Colors.black.withOpacity(0.5),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 16,
                            bottom: 0,
                            child: PopupMenuButton(
                              tooltip: 'Сменить аватарку',
                              position: PopupMenuPosition.under,
                              offset: Offset(24, 0),
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem<int>(
                                    value: 0,
                                    onTap: () async {
                                      final croppedImageData = await pickAndCropImage(
                                        context: context,
                                        imageSource: ImageSource.gallery,
                                        aspectRatio: 1 / 1,
                                      );
                                      if (croppedImageData != null) {
                                        editProfileNotifier.setAvatar(croppedImageData);
                                      }
                                    },
                                    child: ListTile(
                                      title: const Text('Новое фото'),
                                    )),
                                if (editProfileState.canRestoreAvatar)
                                  PopupMenuItem<int>(
                                      value: 1,
                                      onTap: () {
                                        editProfileNotifier.restoreOldAvatar();
                                      },
                                      child: ListTile(
                                        title: const Text('Вернуть старое фото'),
                                      )),
                                if (editProfileState.canDeleteAvatar)
                                  PopupMenuItem<int>(
                                      value: 1,
                                      onTap: () {
                                        editProfileNotifier.deleteAvatar();
                                      },
                                      child: ListTile(
                                        title: const Text('Удалить фото'),
                                      )),
                              ],

                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AvatarProfileImage(
                                    // imageBytes: _avatarImageBytes,
                                    imageProvider: avatarImageProvider,
                                    showPlaceholder: false,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40.0),
                                    child: Container(
                                      width: 76,
                                      height: 76,
                                      color: Colors.black.withOpacity(0.5),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                label: Text('Имя'),
                                errorText: editProfileState.nameErrorText,
                              ),
                              maxLength: 20,
                              controller: _nameController,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                label: Text('О себе'),
                                errorText: editProfileState.descriptionErrorText,
                              ),
                              minLines: 3,
                              maxLines: null,
                              maxLength: 140,
                              keyboardType: TextInputType.text,
                              controller: _descriptionController,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.deny('')
                              // ],
                            ),
                            SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                label: Text('Тэг'),
                                errorText: editProfileState.tagErrorText
                              ),
                              maxLength: 20,
                              controller: _tagController,
                              inputFormatters: [
                                NoWhitespacesTextInputFormatter(),
                              ],
                            ),
                            SizedBox(height: 8),
                            _ProfilePrivacySwitch(
                              initialValue: editProfileState.isPrivate,
                              onChanged: (newValue) {
                                editProfileNotifier.privacyChanged(newValue);
                              },
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}

class _ProfilePrivacySwitch extends StatefulWidget {
  final bool initialValue;
  final void Function(bool newValue) onChanged;

  const _ProfilePrivacySwitch({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<_ProfilePrivacySwitch> createState() => _ProfilePrivacySwitchState();
}

class _ProfilePrivacySwitchState extends State<_ProfilePrivacySwitch> {
  late bool _isPrivate;

  @override
  void initState() {
    _isPrivate = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Приватный профиль'),
        SizedBox(width: 4),
        Switch(
          value: _isPrivate,
          onChanged: (newValue) {
            widget.onChanged(newValue);
            setState(() {
              _isPrivate = newValue;
            });
          }
        ),
      ],
    );;
  }
}
