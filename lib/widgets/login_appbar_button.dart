import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:selfdevers/auth/show_login_dialog.dart';
import 'package:selfdevers/screens/login_manager_screen.dart';

class LoginAppBarButton extends ConsumerWidget {
  const LoginAppBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    if (authState is AuthStateLoading || authState is AuthStateLoggedIn) {
      return SizedBox();
    }

    return FilledButton(
      onPressed: () {
        showLoginDialog(context);
      },
      child: Text('Войти'),
    );
  }
}
