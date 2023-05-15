import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/profile/profile_dto.dart';
import 'package:selfdevers/profile/profile_notifier.dart';
import 'package:selfdevers/profile/user_validator.dart';

import '../api/status_codes.dart';
import '../profile/pick_and_crop_image.dart';
import '../profile/user.dart';
import 'edit_profile_state.dart';

final editProfileNotifierProvider = StateNotifierProvider.family.autoDispose<EditProfileNotifier, EditProfileState, User>((ref, user) {
  return EditProfileNotifier(ref, user);
});

class EditProfileNotifier extends StateNotifier<EditProfileState> {
  final Ref _ref;
  final User _user;

  EditProfileNotifier(this._ref, this._user) : super(EditProfileState(
    name: _user.name,
    description: _user.description,
    tag: _user.userTag,
    isPrivate: _user.isPrivate,
    avatarUrl: _user.avatarUrl,
    backgroundUrl: _user.backgroundUrl,
  ));

  void nameChanged(String newName) {
    state.nameErrorText = UserValidator.validateName(newName);
    state = state.copyWith(name: newName);
  }

  void descriptionChanged(String newDescription) {
    state.descriptionErrorText = UserValidator.validateDescription(newDescription);
    state = state.copyWith(description: newDescription);
  }

  void tagChanged(String newTag) {
    state.tagErrorText = UserValidator.validateTag(userId: _user.id, tag: newTag);
    state = state.copyWith(tag: newTag);
  }

  void privacyChanged(bool isPrivate) {
    state = state.copyWith(isPrivate: isPrivate); 
  }

  void setAvatar(PickAndCropImageResult pickedAvatarImageData) {
    state.newAvatarData = pickedAvatarImageData;
    state = state.copyWith();
  }

  void setBackground(PickAndCropImageResult pickedBackgroundImageData) {
    state.newBackgroundData = pickedBackgroundImageData;
    state = state.copyWith();
  }

  void deleteAvatar() {
    state.newAvatarData = null;
    state = state.copyWith(isAvatarDeleted: true);
  }

  void deleteBackground() {
    state.newBackgroundData = null;
    state = state.copyWith(isBackgroundDeleted: true);
  }

  void restoreOldAvatar() {
    state.newAvatarData = null;
    state = state.copyWith(isAvatarDeleted: false);
  }

  void restoreOldBackground() {
    state.newBackgroundData = null;
    state = state.copyWith(isBackgroundDeleted: false);
  }


  Future<void> save() async {
    if (state.canSave) {
      try {
        state = state.copyWith(saveState: EditProfileSaveState.savingInProgress);

        // Сначала меняем аватарку
        if (state.newAvatarData != null) {
          await _ref.read(apiProvider).post(
            ApiServices.updateAvatar,
            FormData.fromMap({
              'file': MultipartFile.fromBytes(
                state.newAvatarData!.imageBytes,
                filename: state.newAvatarData!.filename)
            }),
          );
        } else if (state.isAvatarDeleted) {
          await _ref.read(apiProvider).post(ApiServices.removeAvatar);
        }

        // Потом бэкграунд
        if (state.newBackgroundData != null) {
          await _ref.read(apiProvider).post(
            ApiServices.updateBackground,
            FormData.fromMap({
              'file': MultipartFile.fromBytes(
                  state.newBackgroundData!.imageBytes,
                  filename: state.newBackgroundData!.filename)
            }),
          );
        } else if (state.isBackgroundDeleted) {
          await _ref.read(apiProvider).post(ApiServices.removeBackground);
        }

        // Потом описание, приватность и тд
        final response = await _ref.read(apiProvider).post(
            ApiServices.updateProfile,
            {
              'name': state.name,
              'userTag': state.tag,
              'description': state.description,
              'isPrivate': state.isPrivate,
            }
        );

        final user = User.fromJson(response.data);

        _ref.read(profileNotifierProvider(user.userTag).notifier).loadUser();

        state = state.copyWith(saveState: EditProfileSaveState.saved);
      } on DioError catch (e) {
        if (e.type == DioErrorType.response) {
          final response = e.response!;
          if (response.statusCode == StatusCodes.incorrectInput &&
              response.data['message'] == 'Извините, данный тег занят') {
            state.tagErrorText = 'Извините, данный тег занят';
          }
        }

        state = state.copyWith(saveState: EditProfileSaveState.notSaving);
      }

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
  }
}
