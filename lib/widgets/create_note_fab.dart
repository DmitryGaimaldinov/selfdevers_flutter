import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/home/home_screen.dart';
import 'package:selfdevers/widgets/neon_floating_action_button.dart';
import 'package:selfdevers/widgets/neon_hover_container.dart';

import '../auth/auth_notifier.dart';
import '../auth/auth_state.dart';
import '../create_note/create_note_dialog.dart';

final showCreateNoteFabProvider = Provider.autoDispose<bool>((ref) {
  return ref.watch(showFloatingWidgetsProvider) &&
      ref.watch(authStateProvider) is AuthStateLoggedIn;
});

class CreateNoteFAB extends ConsumerWidget {
  const CreateNoteFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeonFloatingActionButton(
      onPressed: () {
        showCreateNoteDialog(context);
      },
      icon: Icon(Icons.mode_edit),
      label: 'Написать пост',
    );

    // return Consumer(
    //     builder: (context, ref, _) {
    //       final isDesktop = ref.watch(layoutModeProvider) == LayoutMode.desktop;
    //
    //       final theme = Theme.of(context);
    //       final shadowColor = theme.colorScheme.primary;
    //       final isEnabled = true;
    //
    //       return NeonHoverContainer(
    //         child: FloatingActionButton.extended(
    //           backgroundColor: shadowColor.withOpacity(0.5),
    //           shape: RoundedRectangleBorder(
    //             side: BorderSide(width: 1, color: Colors.white),
    //             borderRadius: BorderRadius.circular(24
    //           )),
    //           isExtended: isDesktop,
    //           onPressed: () {
    //             showCreateNoteDialog(context);
    //           },
    //           icon: Icon(Icons.mode_edit),
    //           label: DefaultTextStyle.merge(
    //             style: TextStyle(
    //                 color: isEnabled ? Colors.white : theme.disabledColor,
    //                 shadows: [
    //                   if (isEnabled)
    //                     for (double i = 1; i < 3; i++)
    //                       Shadow(
    //                         blurRadius: (_isHovered ? 3 : 1) * i,
    //                         color: shadowColor,
    //                       ),
    //                 ]
    //             ),
    //             child: const Text('Написать пост')
    //           ),
    //         ),
    //       );
    //     }
    // );
  }
}