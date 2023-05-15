import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? errorText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffixIcon;

  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.errorText,
    this.maxLength,
    this.textInputType,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48.0),
        ),
        contentPadding: const EdgeInsets.all(24.0),
        errorText: errorText,
        errorMaxLines: 2,
        suffixIcon: suffixIcon,
      ),
    );
  }
}