enum AuthException {
  emailAlreadyTaken('Этот email занят'),
  noSuchEmail('Пользователь с таким e-mail не зарегестрирован'),
  incorrectPassword('Неверный пароль')
  ;

  final String message;

  const AuthException(this.message);

  // TODO: Возможно, здесь стоит сделать возвращаемое значение типа
  // AuthException?. Т.е. возвращать null вместо throw
  static AuthException fromMessage(String message) {
    for (AuthException exception in AuthException.values) {
      if (exception.message == message) {
        return exception;
      }
    }
    throw 'Не найден AuthException с message: $message';
  }

  static bool isAuthException(String exceptionMessage) {
    return AuthException.values
        .any((authException) => authException.message == exceptionMessage);
  }
}