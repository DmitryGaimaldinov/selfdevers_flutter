import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  final String noActionText;
  final String actionText;
  final void Function() onActionTextTap;

  const LoginFooter({
    Key? key,
    required this.noActionText,
    required this.actionText,
    required this.onActionTextTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(noActionText),
        TextButton(
            onPressed: onActionTextTap,
            child: Text(actionText)),
      ],
    );
  }
}