import 'package:flutter/material.dart';
import 'package:selfdevers/styles/text_styles.dart';

class UserNameTagText extends StatelessWidget {
  final String name;
  final String tag;

  const UserNameTagText({
    Key? key,
    required this.name,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 4)),
          TextSpan(
            text: '@$tag',
            style: TextStyles.light1,
          ),
        ]
      )
    );
  }
}
