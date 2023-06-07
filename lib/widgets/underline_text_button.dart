import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class UnderlineTextButton extends StatefulWidget {
  final void Function() onPressed;
  final List<InlineSpan> spans;

  const UnderlineTextButton({
    super.key,
    required this.onPressed,
    required this.spans,
  });

  @override
  _UnderlineTextButtonState createState() => _UnderlineTextButtonState();
}

class _UnderlineTextButtonState extends State<UnderlineTextButton> {
  late final _r = TapGestureRecognizer()..onTap = _onTap;
  var _hovered = false;

  @override
  void dispose() {
    _r.dispose();
    super.dispose();
  }

  void _onTap() => print('Link was clicked');

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Text.rich(
          TextSpan(
            style: _hovered ? TextStyles.underlinedButton(context) : null,
            children: widget.spans,
          ),
        ),
      ),
    );
  }
}