import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:selfdevers/main.dart';


Future<T> showAdaptiveDialog<T>({
  required BuildContext context,
  required Widget screen
}) async {
  return await Navigator.of(context).push(PageRouteBuilder(
    fullscreenDialog: true,
    opaque: false,
    barrierDismissible: true,
    pageBuilder: (context, _, __) => Consumer(
      builder: (context, ref, _) {
        final isMobile = ref.watch(isMobileModeProvider);

        return ClipRect(
          child: BackdropFilter(
            blendMode: BlendMode.srcIn,
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: CenterConstrained(
              child: Padding(
                padding: isMobile ? EdgeInsets.zero : EdgeInsets.all(64),
                child: Container(
                  decoration: isMobile ? null : BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      for(double i = 1; i < 5; i++)
                        BoxShadow(
                          spreadRadius: -1,
                          color: Theme.of(context).primaryColor.withOpacity(0.8),
                          blurRadius: 3 * i,
                          blurStyle: BlurStyle.outer,
                        ),
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: isMobile ? BorderRadius.circular(0) : BorderRadius.circular(24),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          scaffoldBackgroundColor: isMobile ? null : Colors.transparent),
                      child: screen
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    ),
  ));
}

class AdaptiveDialog extends ConsumerWidget {
  final Widget child;

  const AdaptiveDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobileMode = ref.watch(isMobileModeProvider);

    if (isMobileMode) {
      return child;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
