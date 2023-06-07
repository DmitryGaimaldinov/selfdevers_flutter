import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/screens/login_screen.dart';
import 'package:selfdevers/screens/register_screen.dart';

enum LoginState {
  register,
  login,
}

final loginStateProvider = StateProvider<LoginState>((ref) {
  return LoginState.login;
});


class LoginManagerScreen extends ConsumerWidget {
  const LoginManagerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateProvider);
    switch (loginState) {
      case LoginState.register:
        return const RegisterScreen();
      case LoginState.login:
        return const LoginScreen();
    }
  }
}
