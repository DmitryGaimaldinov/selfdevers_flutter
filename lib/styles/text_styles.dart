import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {

  TextStyles._();

  static const light1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontFamily: 'Light',
  );
  static const light2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontFamily: 'Light',
  );

  static TextStyle underlinedButton(BuildContext context) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dotted,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}