import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/status_codes.dart';
import 'package:selfdevers/utils/secure_storage.dart';

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository._(ref);
});


class TokenRepository {
  final Ref _ref;

  TokenRepository._(this._ref);

  Future<String?> loadAccessToken() async {
    print('start loading access token');
    // get token from secure storage
    final accessToken = await SecureStorage.instance.getAccessToken();
    if (accessToken != null && !JwtDecoder.isExpired(accessToken)) {
      return accessToken;
    }

    final refreshToken = await SecureStorage.instance.getRefreshToken();
    if (refreshToken == null) {
      return null;
    }

    final _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));

    try {
      final response = await _dio.post(ApiServices.refreshTokens, data: {
        'refreshToken': refreshToken
      });

      print('refresh token response.data: ${response.data}');

      final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];

      await SecureStorage.instance.setAccessToken(newAccessToken);
      await SecureStorage.instance.setRefreshToken(newRefreshToken);

      return newAccessToken;
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        final response = e.response!;
        if (response.statusCode == StatusCodes.unauthorized) {
          // TODO: Выводить сообщение о том, что время предыдущей сесси истекло
          // Т.е. выводить response.data['message']

          await SecureStorage.instance.setAccessToken(null);
          await SecureStorage.instance.setRefreshToken(null);
          return null;
        }
      }

      rethrow;
    }
  }
}