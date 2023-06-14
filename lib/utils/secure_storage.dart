import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static const _instance = Storage._();
  static Storage get instance => _instance;

  const Storage._();

  // final _secureStorage = const Shae();

  Future<void> setAccessToken(String? accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (accessToken != null) {
      await prefs.setString('access_token', accessToken);
    } else {
      await prefs.remove('access_token');
    }
  }

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('access_token');
  }


  Future<void> setRefreshToken(String? refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (refreshToken != null) {
      await prefs.setString('refresh_token', refreshToken);
    } else {
      await prefs.remove('refresh_token');
    }
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('refresh_token');
  }
}