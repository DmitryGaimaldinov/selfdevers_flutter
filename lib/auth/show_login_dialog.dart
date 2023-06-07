import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_manager_screen.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/screens/login_manager_screen.dart';
import 'package:selfdevers/screens/register_screen.dart';
import 'package:selfdevers/widgets/show_adaptive_dialog.dart';

Future<void> showLoginDialog(BuildContext context) =>
    showAdaptiveDialog(context: context, screen: const LoginManagerScreen());
