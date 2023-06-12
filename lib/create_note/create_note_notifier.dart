import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selfdevers/api/notes/dto/create_note_dto.dart';
import 'package:selfdevers/api/notes/notes_service.dart';
import 'package:selfdevers/api/photos/photos_service.dart';
import 'package:selfdevers/create_note/models/send_note_dto.dart';
import 'package:selfdevers/profile/pick_and_crop_image.dart';

import 'create_note_state.dart';

final createNoteStateProvider =
    StateNotifierProvider.autoDispose<CreateNoteNotifier, CreateNoteState>(
        (ref) {
  final notifier = CreateNoteNotifier(ref);

  return notifier;
});

// TODO: будет хранить в себе состояние контента
// и в зависимости от него в состоянии выдавать
// canSend (если все заметки не пустые),
// canSaveToDraft (если хотя бы одна заметка не пустая).
//
// Но не знаю, можно ли в нём хранить canAddNewEmptyNote (это если текущая не пустая).
// Вот это уже мне кажется UI тема, а не логика приложения.
class CreateNoteNotifier extends StateNotifier<CreateNoteState> {
  final Ref _ref;

  CreateNoteNotifier(this._ref)
      : super(const CreateNoteState(isSending: false));

  CancelToken? _cancelToken;

  Future<void> send({required List<SendNoteDto> sendNoteDtos}) async {
    state = state.copyWith(isSending: true);
    int? parentId;

    for (final dto in sendNoteDtos) {
      if (!mounted) {
        break;
      }

      final imageIds = <int>[];

      // Загружаем фотографии на сервер
      if (dto.imageXFiles.isNotEmpty) {
        final List<MemoryNamedImage> images = await Future.wait(
          dto.imageXFiles.map((xFile) async => MemoryNamedImage(
              filename: xFile.name, imageBytes: await xFile.readAsBytes())),
        );
        _cancelToken = CancelToken();
        final uploadResult = await PhotosService(_ref).uploadImages(
          memoryNamedImages: images,
          cancelToken: _cancelToken,
        );
        imageIds.addAll(uploadResult.imageIds);
      }
      if (!mounted) {
        break;
      }

      // Загружаем пост на сервер
      _cancelToken = CancelToken();
      final int noteId = await _ref.read(notesServiceProvider).createNote(
            CreateNoteDto(
              text: dto.text,
              parentId: parentId,
              quotedNoteId: dto.quotedNoteId,
              imageIds: imageIds,
            ),
            cancelToken: _cancelToken,
          );
      parentId = noteId;
      if (!mounted) {
        break;
      }
    }

    if (mounted) {
      state = state.copyWith(isSending: false);
    }
  }
}
