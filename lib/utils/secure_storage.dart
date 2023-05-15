import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _instance = SecureStorage._();
  static SecureStorage get instance => _instance;

  const SecureStorage._();

  final _secureStorage = const FlutterSecureStorage();

  Future<void> setAccessToken(String? accessToken) async {
    await _secureStorage.write(key: 'access_token', value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }


  Future<void> setRefreshToken(String? refreshToken) async {
    await _secureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'refresh_token');
  }
}