import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/show_login_dialog.dart';
import 'package:selfdevers/widgets/login/login_button.dart';
import 'package:selfdevers/widgets/neon_outlined_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            if (currentUser == null) {
              return NeonOutlinedButton(
                onPressed: () => showLoginDialog(context),
                child: Text('Войти'),
              );
            }

            return NeonOutlinedButton(
              neonColor: Theme.of(context).colorScheme.error,
              onPressed: () {
                ref.read(authStateProvider.notifier).logout();
              },
              child: Text('Выйти'),
            );
          },
        ),
      ),
    );
  }
}
