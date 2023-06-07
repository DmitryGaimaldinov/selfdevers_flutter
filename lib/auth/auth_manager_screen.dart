// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:selfdevers/auth/auth_notifier.dart';
// import 'package:selfdevers/screens/login_manager_screen.dart';
// import 'package:selfdevers/screens/splash_screen.dart';
//
// import '../feed/feed_screen.dart';
// import 'auth_state.dart';
// import '../screens/home_screen.dart';
//
// class AuthManagerScreen extends ConsumerWidget {
//   const AuthManagerScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authStateProvider);
//     if (authState is AuthStateLoading) {
//       return const SplashScreen();
//     } else if (authState is AuthStateNotLoggedIn) {
//       return const LoginManagerScreen();
//     } else if (authState is AuthStateLoggedIn) {
//       return const HomeScreen();
//     } else {
//       throw Exception('Нет экрана для AuthState: $authState');
//     }
//   }
// }
