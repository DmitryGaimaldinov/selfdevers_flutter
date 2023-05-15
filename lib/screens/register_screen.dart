import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/exceptions/auth_exception.dart';
import 'package:selfdevers/styles/text_styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:selfdevers/widgets/login/login_button.dart';
import 'package:selfdevers/widgets/login/login_title_text.dart';

import '../widgets/login/login_email_text_field.dart';
import '../widgets/login/login_footer_text.dart';
import '../widgets/login/login_password_text_field.dart';
import '../widgets/login/login_text_field.dart';
import 'login_manager_screen.dart';
import 'login_screen.dart';

// NAME
final nameInputProvider = StateProvider<String>((ref) {
  return '';
});

final nameErrorTextProvider = StateProvider<String?>((ref) {
  return null;
});

// EMAIL
final emailInputProvider = StateProvider<String>((ref) {
  return '';
});

final emailErrorTextProvider = StateProvider<String?>((ref) {
  return null;
});


// PASSWORD
final passwordErrorTextProvider = StateProvider<String?>((ref) {
  return null;
});

final passwordInputProvider = StateProvider<String>((ref) {
  return '';
});


class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController()
      ..addListener(() {
        ref.read(nameInputProvider.notifier).state = _nameController.text;
      });

    _emailController = TextEditingController()
      ..addListener(() {
        ref.read(emailInputProvider.notifier).state = _emailController.text;
      });

    _passwordController = TextEditingController()
      ..addListener(() {
        ref.read(passwordInputProvider.notifier).state = _passwordController.text;
      });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitRegister() async {
    // Проверяем, валидно ли введено имя
    final name = ref.read(nameInputProvider).trim();
    String? nameErrorText;
    if (name.isEmpty) {
      nameErrorText = 'Имя не должно быть пустым';
    } else if (name.length > 20) {
      nameErrorText = 'Имя не должно превышать 20 символов';
    }
    ref.read(nameErrorTextProvider.notifier).state = nameErrorText;


    // Валидно ли введён email
    final email = ref.read(emailInputProvider).trim();
    String? emailErrorText;
    if (!EmailValidator.validate(email)) {
      emailErrorText = 'Введите корректный email';
    }
    ref.read(emailErrorTextProvider.notifier).state = emailErrorText;


    // Валидно ли введён пароль
    final password = ref.read(passwordInputProvider).trim();
    final passwordRegExp = RegExp('((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*');
    String? passwordErrorText;
    if (password.length < 4 || password.length > 20) {
      passwordErrorText = 'Пароль должен быть не меньше 4 символов';
    } else if (!passwordRegExp.hasMatch(password)) {
      passwordErrorText = 'Пароль слишком лёгкий';
    }
    ref.read(passwordErrorTextProvider.notifier).state = passwordErrorText;

    if (nameErrorText == null &&
        passwordErrorText == null &&
        emailErrorText == null) {

      try {
        // TODO: Сохранять access и refresh токены.
        // Изменить значение authProvider'ов.
        await ref.read(authNotifierProvider.notifier).register(
            name: name,
            email: email,
            password: password);
      } on AuthException catch (e) {
        if (e == AuthException.emailAlreadyTaken) {
          ref.read(emailErrorTextProvider.notifier).state = e.message;
        } else {
          rethrow;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: backgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 112),
                      child: LoginTitleText('Станьте частью сообщества саморазвиванцев'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56),
                      child: Column(
                        children: [
                          _NameTextField(controller: _nameController),
                          SizedBox(height: 16),
                          Consumer(
                            builder: (_, ref, __) {
                              return EmailTextField(
                                controller: _emailController,
                                errorText: ref.watch(emailErrorTextProvider),
                              );
                            },
                          ),
                          SizedBox(height: 16),
                          Consumer(
                            builder: (_, ref, __) {
                              return PasswordTextField(
                                controller: _passwordController,
                                errorText: ref.watch(passwordErrorTextProvider),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    LoginButton(
                      onPressed: _submitRegister,
                      child: const Text('Зарегестрироваться'),
                    ),
                    Spacer(),
                    SizedBox(height: 48),
                    LoginFooter(
                      noActionText: 'Уже имеете аккаунт?',
                      actionText: 'Войти',
                      onActionTextTap: () {
                        ref.read(loginStateProvider.notifier).state = LoginState.login;
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NameTextField extends ConsumerWidget {
  final TextEditingController controller;

  const _NameTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoginTextField(
      hintText: 'Имя',
      controller: controller,
      errorText: ref.watch(nameErrorTextProvider),
      maxLength: 20,
    );
  }
}


