import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/profile/related_user_fields.dart';

import 'user.dart';

abstract class ProfileState {}

class ProfileStateLoading extends ProfileState {}


class ProfileStateNotFound extends ProfileState {}

class ProfileStateLoaded extends ProfileState {
  final UserDto userDto;

  ProfileStateLoaded(this.userDto);
}

// Здесь будет кнопка подписки/запроса.
// Нужно учитывать, вошёл ли пользователь.
// Если да, то находится ли он в чёрном списке.
// Если нет, то является ли профиль приватным.
// И вот только потом можно уже решать,
// будет ли здесь кнопка, и какая.
// Можно сделать кнопку "Войти, чтобы подписаться"
// enum ProfileSubscribeAction {
//   loginToFollow,
//   follow,
//   unfollow,
// }


