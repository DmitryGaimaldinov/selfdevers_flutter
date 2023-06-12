import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selfdevers/profile/user_validator.dart';

import '../profile/pick_and_crop_image.dart';

enum EditProfileSaveState {
  notSaving,
  savingInProgress,
  saved,
}

class EditProfileState {
  final String name;
  final String description;
  final String tag;
  final bool isPrivate;
  final EditProfileSaveState saveState;
  final bool isAvatarDeleted;
  final bool isBackgroundDeleted;
  final String? avatarUrl;
  final String? backgroundUrl;

  MemoryNamedImage? newAvatarData;
  MemoryNamedImage? newBackgroundData;

  String? nameErrorText;
  String? descriptionErrorText;
  String? tagErrorText;

  EditProfileState({
    required this.name,
    required this.description,
    required this.tag,
    required this.isPrivate,
    required this.avatarUrl,
    required this.backgroundUrl,
    this.saveState = EditProfileSaveState.notSaving,
    this.isAvatarDeleted = false,
    this.isBackgroundDeleted = false,
    this.newBackgroundData,
    this.newAvatarData,
    this.nameErrorText,
    this.descriptionErrorText,
    this.tagErrorText,
  });

  EditProfileState copyWith({
    String? name,
    String? description,
    String? tag,
    EditProfileSaveState? saveState,
    bool? isAvatarDeleted,
    bool? isBackgroundDeleted,
    bool? isPrivate,
  }) {
    return EditProfileState(
      name: name ?? this.name,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      saveState: saveState ?? this.saveState,
      isAvatarDeleted: isAvatarDeleted ?? this.isAvatarDeleted,
      isBackgroundDeleted: isBackgroundDeleted ?? this.isBackgroundDeleted,
      isPrivate: isPrivate ?? this.isPrivate,
      avatarUrl: avatarUrl,
      backgroundUrl: backgroundUrl,
      newAvatarData: newAvatarData,
      newBackgroundData: newBackgroundData,
      nameErrorText: nameErrorText,
      descriptionErrorText: descriptionErrorText,
      tagErrorText: tagErrorText,
    );
  }

  Uint8List? get avatarImageBytes => newAvatarData?.imageBytes;
  Uint8List? get backgroundImageBytes => newBackgroundData?.imageBytes;

  bool get canSave {
    return ((nameErrorText == null) &&
        (descriptionErrorText == null) &&
        (tagErrorText == null));
  }

  bool get canDeleteAvatar {
    if (isAvatarDeleted) {
      return false;
    }

    if (avatarUrl == null && newAvatarData == null) {
      return false;
    }

    return true;
  }

  bool get canDeleteBackground {
    if (isBackgroundDeleted) {
      return false;
    }

    if (backgroundUrl == null && newBackgroundData == null) {
      return false;
    }

    return true;
  }

  bool get canRestoreAvatar {
    if (avatarUrl != null && (isAvatarDeleted || newAvatarData != null)) {
      return true;
    }

    return false;
  }

  bool get canRestoreBackground {
    if (backgroundUrl != null &&
        (isBackgroundDeleted || newBackgroundData != null)) {
      return true;
    }

    return false;
  }

  ImageProvider? get avatarImageProvider {
    if (avatarImageBytes != null) {
      return MemoryImage(avatarImageBytes!);
    }
    if (avatarUrl != null && !isAvatarDeleted) {
      return NetworkImage(avatarUrl!);
    }

    return null;
  }

  ImageProvider? get backgroundImageProvider {
    if (backgroundImageBytes != null) {
      return MemoryImage(backgroundImageBytes!);
    }
    if (backgroundUrl != null && !isBackgroundDeleted) {
      return NetworkImage(backgroundUrl!);
    }

    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditProfileState &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          tag == other.tag &&
          isPrivate == other.isPrivate &&
          saveState == other.saveState &&
          isAvatarDeleted == other.isAvatarDeleted &&
          isBackgroundDeleted == other.isBackgroundDeleted &&
          avatarUrl == other.avatarUrl &&
          backgroundUrl == other.backgroundUrl &&
          newAvatarData == other.newAvatarData &&
          newBackgroundData == other.newBackgroundData &&
          nameErrorText == other.nameErrorText &&
          descriptionErrorText == other.descriptionErrorText &&
          tagErrorText == other.tagErrorText;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      tag.hashCode ^
      isPrivate.hashCode ^
      saveState.hashCode ^
      isAvatarDeleted.hashCode ^
      isBackgroundDeleted.hashCode ^
      avatarUrl.hashCode ^
      backgroundUrl.hashCode ^
      newAvatarData.hashCode ^
      newBackgroundData.hashCode ^
      nameErrorText.hashCode ^
      descriptionErrorText.hashCode ^
      tagErrorText.hashCode;

  @override
  String toString() {
    return 'EditProfileState{name: $name, description: $description, tag: $tag, isPrivate: $isPrivate, isSavingInProgress: $saveState, isAvatarDeleted: $isAvatarDeleted, isBackgroundDeleted: $isBackgroundDeleted, avatarUrl: $avatarUrl, backgroundUrl: $backgroundUrl, newAvatarData: $newAvatarData, newBackgroundData: $newBackgroundData, nameErrorText: $nameErrorText, descriptionErrorText: $descriptionErrorText, tagErrorText: $tagErrorText}';
  }
}
