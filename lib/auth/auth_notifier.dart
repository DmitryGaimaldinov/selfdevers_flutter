import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:selfdevers/api/ws_api.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/repositories/token_repository.dart';
import 'package:selfdevers/utils/secure_storage.dart';

import '../api/api.dart';
import '../api/api_services.dart';
import '../api/auth/dto/auth_result_dto.dart';
import '../api/status_codes.dart';
import '../api/users/dto/user_dto.dart';
import 'auth_result_dto.dart';
import 'auth_state.dart';
import 'exceptions/auth_exception.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

final currentUserProvider = Provider<UserDto?>((ref) {
  final authState = ref.watch(authStateProvider);
  if (authState is AuthStateLoggedIn) {
    return authState.user;
  }

  return null;
});


class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  AuthNotifier(this.ref) : super(AuthStateLoading()) {
    // TODO: Здесь производить вход через accessToken/refreshToken
    // SecureStorage.instance.getAccessToken()
    _init();
  }

  Future<void> _init() async {
    final accessToken = await TokenRepository().loadAccessToken();

    print('accessToken: ${accessToken}');

    // TODO: Здесь получать с бэкенда информацию о пользователе
    // и заполнять currentUser
    if (accessToken == null) {
      state = AuthStateNotLoggedIn();
      // Здесь мб должно быть что-то вроде получения токена по
      // рефреш-токену, ну да пофиг
    } else {
      final userId = JwtDecoder.decode(accessToken)['sub'];
      final response = await ref.read(apiProvider)
          .post(ApiServices.getUser, { 'userTag': 'id$userId' });

      if (response.statusCode == StatusCodes.created) {
        final user = UserDto.fromJson(response.data);

        state = AuthStateLoggedIn(user);
      } else {
        state = AuthStateNotLoggedIn();
      }
    }

    // ref.read(currentUserProvider.notifier).state = currentUser;
  }

  Future<void> register({
    required String name,
    required String email,
    required String password
  }) async {
    try {
      debugPrint('REGISTER');
      final result = await ref.read(apiProvider).post(
        ApiServices.register,
        {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      print(result.data);

      final authResult = AuthResultDto.fromJson(result.data);
      // ref.read(currentUserProvider.notifier).state = authResult.user;
      await _setAuthCredentials(authResult);

      state = AuthStateLoggedIn(authResult.user);
      ref.read(wsApiProvider).refreshToken();
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        final response = e.response!;

        // Если это ошибка ввода данных
        if (response.statusCode == StatusCodes.incorrectInput &&
            AuthException.isAuthException(response.data['message'])) {

          throw AuthException.fromMessage(response.data['message']);
        } else {
          debugPrint(response.data);
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  Future<void> login({
    required String email,
    required String password
  }) async {
    try {
      final result = await ref.read(apiProvider).post(
        ApiServices.login,
        {
          'email': email,
          'password': password,
        },
      );

      final authResult = AuthResultDto.fromJson(result.data);
      // ref.read(currentUserProvider.notifier).state = authResult.user;
      await _setAuthCredentials(authResult);

      state = AuthStateLoggedIn(authResult.user);
      ref.read(wsApiProvider).refreshToken();
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        final response = e.response!;
        if (response.statusCode == StatusCodes.incorrectInput &&
            AuthException.isAuthException(response.data['message'])) {

          throw AuthException.fromMessage(response.data['message']);
        } else {
          print(response);
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  Future<void> logout() async {
    await Storage.instance.setAccessToken(null);
    await Storage.instance.setRefreshToken(null);

    state = AuthStateNotLoggedIn();
    ref.read(wsApiProvider).refreshToken();
  }

  Future<void> _setAuthCredentials(AuthResultDto authResult) async {
    await Storage.instance.setAccessToken(authResult.accessToken);
    await Storage.instance.setRefreshToken(authResult.refreshToken);
  }
}

