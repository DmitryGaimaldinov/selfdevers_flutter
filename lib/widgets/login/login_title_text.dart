import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class LoginTitleText extends StatelessWidget {
  final String text;

  const LoginTitleText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.loginTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}
