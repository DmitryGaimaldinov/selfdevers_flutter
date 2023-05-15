import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const EmailTextField({
    Key? key,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      hintText: 'Email',
      controller: controller,
      errorText: errorText,
      textInputType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      maxLength: null,
    );
  }
}