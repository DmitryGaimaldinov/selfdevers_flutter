import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/api_services.dart';
import 'package:selfdevers/api/status_codes.dart';
import 'package:selfdevers/utils/secure_storage.dart';

// final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
//   return TokenRepository._(ref);
// });

class TokenRepository {
  final _dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
  ));

  Future<String?> loadAccessToken() async {
    print('start loading access token');
    // get token from secure storage
    final accessToken = await Storage.instance.getAccessToken();
    if (accessToken != null && !JwtDecoder.isExpired(accessToken)) {
      return accessToken;
    }

    final refreshToken = await Storage.instance.getRefreshToken();
    if (refreshToken == null) {
      return null;
    }

    try {
      final response = await _dio.post(ApiServices.refreshTokens, data: {
        'refreshToken': refreshToken
      });

      print('refresh token response.data: ${response.data}');

      final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];

      await Storage.instance.setAccessToken(newAccessToken);
      await Storage.instance.setRefreshToken(newRefreshToken);

      return newAccessToken;
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        final response = e.response!;
        if (response.statusCode == StatusCodes.unauthorized) {
          // TODO: Выводить сообщение о том, что время предыдущей сесси истекло
          // Т.е. выводить response.data['message']

          await Storage.instance.setAccessToken(null);
          await Storage.instance.setRefreshToken(null);
          return null;
        }
      }

      rethrow;
    }
  }
}