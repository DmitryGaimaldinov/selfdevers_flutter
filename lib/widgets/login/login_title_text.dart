import 'package:flutter/material.dart';
import 'package:selfdevers/widgets/animated_neon_text_style.dart';

import '../../styles/text_styles.dart';

class LoginTitleText extends StatelessWidget {
  final String text;

  const LoginTitleText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedNeonTextStyle(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
