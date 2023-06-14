class UserValidator {

  UserValidator._();

  /// Проверяет, можно ли поставить такое имя пользователю.
  /// Возвращает null если да, и сообщение с ошибкой, если нет.
  static String? validateName(String name) {
    if (name.isEmpty || name.length > 20) {
      return 'Имя пользователя должно содержать от 1 до 20 символов';
    }
    return null;
  }

  /// Проверяет, можно ли поставить такое описание пользователю.
  /// Возвращает null если да, и сообщение с ошибкой, если нет.
  static String? validateDescription(String description) {
    if (description.length > 140) {
      return 'Описание не должно превышать 140 символов';
    }
    return null;
  }

  /// Проверяет, можно ли поставить такой тэг пользователю.
  /// Возвращает null если да, и сообщение с ошибкой, если нет.
  static String? validateTag({required int userId, required String tag}) {
    if (tag.length < 3 || tag.length > 20) {
      return 'Длина тега должна быть от 3 до 20 символов';
    }

    if (tag.startsWith('id')) {
      int? idFromTag = int.tryParse(tag.substring(2));
      if (userId != idFromTag) {
        return 'Недопустимый тэг пользователя, начинающийся с id. Можно только id$userId';
      }
    }

    final tagRegExp = RegExp(r'^[a-z0-9_]+$');
    if(!tagRegExp.hasMatch(tag)) {
      return 'Тэг пользователя может содержать только английские символы, цифры и подчёркивания';
    }

    // TODO: Искать пользователя на сервере по такому тегу
    // Если есть, то выдавать ошибку.
    // Но пока не надо.

    return null;
  }
}