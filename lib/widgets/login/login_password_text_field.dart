import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/utils/no_whitespaces_text_input_formatter.dart';

import '../neon_icon_button.dart';
import 'login_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordShowed = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordShowed = !_isPasswordShowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      hintText: 'Пароль',
      controller: widget.controller,
      errorText: widget.errorText,
      textInputType: TextInputType.visiblePassword,
      maxLength: 20,
      obscureText: _isPasswordShowed ? false : true,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: NeonIconButton(
          onPressed: _togglePasswordVisibility,
          icon: _isPasswordShowed
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          // neonColor: Colors.white,
        ),
      ),
      inputFormatters: [
        NoWhitespacesTextInputFormatter(),
      ],
    );
  }
}