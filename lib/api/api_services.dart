import 'package:dio/dio.dart';


// TODO: Сделать так, чтобы в будущем передавались
// не только названия методов, но и данные.
// А так же, чтобы заранее был известен тип возвращаемого значения.
//
// Не обязательно создавать стратегии как классы.
// Можно создать отдельный класс ApiStrategy, который будет просто
// как DTO (methodType, methodName, data, ExceptionType?)
// И потом создать в ApiServices методы для возвращения
// Такого dto.
// Обработка ошибок останется так же через try catch.
// Так даже код не придётся менять
// class ApiStrategy {
//   String methodType;
//   String methodName;
//   dynamic data;
// }

class ApiServices {
  static String register = 'auth/register';
  static String login = 'auth/login';
  static String refreshTokens = 'auth/refresh-tokens';

  // static String userByTag(String tag) => 'users/' + tag;
  // static String userById(int id) => userByTag('id$id');
  static String getUser = 'users/get-user';

  static String updateAvatar = 'photos/update-avatar';
  static String updateBackground = 'photos/update-background';
  static String removeAvatar = 'photos/remove-avatar';
  static String removeBackground = 'photos/remove-background';
  static String updateProfile = 'users/update-profile';

  // TODO: А что если перенести эти методы в user/follow???????
  // Будет явно удобнее
  static String follow = 'followings/follow';
  static String unfollow = 'followings/unfollow';

  static String getFollowers = 'users/get-followers';
  static String getFollowings = 'users/get-followings';

  ApiServices._();
}