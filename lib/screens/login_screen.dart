import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/exceptions/auth_exception.dart';
import 'package:selfdevers/screens/login_manager_screen.dart';
import 'package:selfdevers/screens/register_screen.dart';
import 'package:selfdevers/styles/text_styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:selfdevers/widgets/login/login_button.dart';
import 'package:selfdevers/widgets/login/login_title_text.dart';

import '../widgets/login/login_email_text_field.dart';
import '../widgets/login/login_footer_text.dart';
import '../widgets/login/login_password_text_field.dart';
import '../widgets/login/login_text_field.dart';

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


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitRegister() async {

    // Валидно ли введён email
    final email = ref.read(emailInputProvider).trim();
    String? emailErrorText;
    if (!EmailValidator.validate(email)) {
      emailErrorText = 'Введите корректный email';
    }
    ref.read(emailErrorTextProvider.notifier).state = emailErrorText;


    // Валидно ли введён пароль
    final password = ref.read(passwordInputProvider).trim();
    // final passwordRegExp = RegExp('((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*');
    // String? passwordErrorText;
    // if (password.length < 4 || password.length > 20) {
    //   passwordErrorText = 'Пароль должен быть не меньше 4 символов';
    // } else if (!passwordRegExp.hasMatch(password)) {
    //   passwordErrorText = 'Пароль слишком лёгкий';
    // }
    // ref.read(passwordErrorTextProvider.notifier).state = passwordErrorText;

    if (emailErrorText == null) {

      try {
        // TODO: Сохранять access и refresh токены.
        // Изменить значение authProvider'ов.
        await ref.read(authNotifierProvider.notifier).login(
            email: email,
            password: password);
      } on AuthException catch (e) {
        if (e == AuthException.noSuchEmail) {
          ref.read(emailErrorTextProvider.notifier).state = e.message;
        } else if (e == AuthException.incorrectPassword) {
          ref.read(passwordErrorTextProvider.notifier).state = e.message;
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
                      child: LoginTitleText('Добро пожаловать, саморазвиванец'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56),
                      child: Column(
                        children: [
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
                      child: const Text('Войти'),
                    ),
                    Spacer(),
                    SizedBox(height: 48),
                    LoginFooter(
                      noActionText: 'Ещё не зарегестрированы?',
                      actionText: 'Создать аккаунт',
                      onActionTextTap: () {
                        ref.read(loginStateProvider.notifier).state = LoginState.register;
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


