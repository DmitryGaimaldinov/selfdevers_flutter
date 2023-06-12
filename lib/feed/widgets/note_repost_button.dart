import 'package:flutter/material.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';
import 'package:selfdevers/widgets/tap_scale.dart';

class NoteQuoteButton extends StatelessWidget {
  final int quoteCount;
  final VoidCallback onPressed;
  
  const NoteQuoteButton({
    Key? key,
    required this.quoteCount,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteActionButton(
      onPressed: onPressed,
      iconData: Icons.repeat,
      hoverColor: Colors.green,
      label: '$quoteCount',
    );
  }
}
