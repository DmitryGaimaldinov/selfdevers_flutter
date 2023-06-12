import 'package:selfdevers/api/users/dto/user_dto.dart';

abstract class AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateLoggedIn extends AuthState {
  final UserDto user;

  AuthStateLoggedIn(this.user);
}

class AuthStateNotLoggedIn extends AuthState {}