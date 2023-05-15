import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_manager_screen.dart';
import 'package:selfdevers/utils/my_custom_scroll_behavior.dart';

import 'styles/color-themes.dart';
import 'screens/register_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: lightColorScheme.background, // status bar color
  ));


  // TODO: Обрабатывать UnauthorizedException
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppFlowyEditorLocalizations.delegate,
      ],
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      home: const AuthManagerScreen(),
    );
  }
}
