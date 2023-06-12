import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/notifications/notifications_service.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:selfdevers/repositories/token_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final wsApiProvider = Provider<_WsApi>((ref) {
  return _WsApi(ref);
});

class _WsApi {
  final Ref _ref;

  _WsApi(this._ref);

  // static final _instance = _WsApi._();
  // static _WsApi get instance => _instance;

  late final IO.Socket _socket;

  IO.Socket get socket => _socket;

  Future<void> initialize() async {
    final String? token = await TokenRepository().loadAccessToken();

    _socket = IO.io(BASE_URL,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({ 'token' : token })
            .build());

    _socket.on(
      'unread-notifications-count-changed',
      (count) {
        print('notifications-count-changed. data: $count');
        _ref.read(unreadNotificationsCountProvider.notifier).state = count;
      },
    );

    _socket.connect();
  }

  // Future<void> _handleAuth() async {
  //   final authState = _ref.watch(authStateProvider);
  //   print('authState: $authState');
  //   _refreshToken();
  // }

  Future<void> refreshToken() async {
    final String? token = await TokenRepository().loadAccessToken();
    print('REFRESH TOKEN: $token');
    // _socket.query = 'token=$token';
    // _socket.io
    // print('REFRESH TOKEN. _socket.query: ${_socket.query}');
    _socket.emit('update-token', { 'token': token });
    // _socket..disconnect()..connect();
  }
}