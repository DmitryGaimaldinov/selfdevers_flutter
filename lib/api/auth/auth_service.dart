import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/api/users/dto/user_dto.dart';
import 'package:selfdevers/auth/auth_result_dto.dart';

class AuthService {
  final Ref _ref;
  AuthService(this._ref);

  Api get _api => _ref.read(apiProvider);

  final _serviceName = 'auth';
}