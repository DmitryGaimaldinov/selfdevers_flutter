enum ProfileException {
  userNotFound('Пользователь не найден')
  ;

  final String message;

  const ProfileException(this.message);

  static ProfileException fromMessage(String message) {
    for (ProfileException exception in ProfileException.values) {
      if (exception.message == message) {
        return exception;
      }
    }
    throw 'Не найден AuthException с message: $message';
  }
}