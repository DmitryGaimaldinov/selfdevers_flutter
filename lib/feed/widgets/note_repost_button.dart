import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:selfdevers/auth/show_login_dialog.dart';
import 'package:selfdevers/create_note/create_note_dialog.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';
import 'package:selfdevers/widgets/tap_scale.dart';

class NoteQuoteButton extends ConsumerWidget {
  final NoteDto noteDto;
  final int? quoteCount;
  // final VoidCallback onPressed;
  
  const NoteQuoteButton({
    Key? key,
    this.quoteCount,
    required this.noteDto,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return NoteActionButton(
      onPressed: () {
        if (authState is AuthStateLoggedIn) {
          showCreateNoteDialog(context, quotedNoteDto: noteDto);
        } else {
          showLoginDialog(context);
        }
      },
      iconData: Icons.repeat,
      hoverColor: Colors.green,
      label: (quoteCount != null) ? '$quoteCount' : null,
    );
  }
}
