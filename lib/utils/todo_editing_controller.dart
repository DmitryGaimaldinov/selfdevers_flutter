import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoEditingController extends TextEditingController {

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    // final regexp = RegExp('(?=$escapingMentionCharacter)|(?<=$escapingMentionCharacter)');
    // split result on "Hello ∞ where is ∞?" is: [Hello,∞, where is ,∞,?]
    // Todo: Здесь проблема с пробелами
    final res = text.split(' ');
    // final mentionQueue = _mentionQueue();
    return TextSpan(
      style: style,
      children: res.map((e) {
        if (e.startsWith('@')) {
          // Mandatory WidgetSpan so that it takes the appropriate char number.
          return TextSpan(
            text: e,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            // child: Text(
            //   mention._fullMentionLabel,
            //   style: _mentionStyle,
            // ),
          );
        }
        return TextSpan(text: e, style: style);
      }).toList(),
    );
  }
}