import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/widgets/neon_hover_container.dart';
import 'package:selfdevers/widgets/tap_scale.dart';

class NeonFloatingActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String label;

  const NeonFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  State<NeonFloatingActionButton> createState() =>
      _NeonFloatingActionButtonState();
}

class _NeonFloatingActionButtonState extends State<NeonFloatingActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return TapScale(child: MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Consumer(builder: (context, ref, _) {
        final isDesktop = ref.watch(layoutModeProvider) == LayoutMode.desktop;

        final theme = Theme.of(context);
        final shadowColor = theme.colorScheme.primary;
        final isEnabled = true;

        final borderRadius = BorderRadius.circular(24);

        return FloatingActionButton.extended(
          // backgroundColor: shadowColor.withOpacity(0.5),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: borderRadius,
          ),
          isExtended: isDesktop,
          onPressed: widget.onPressed,
          icon: IconTheme.merge(
            data: IconThemeData(
              color: _isHovered ? shadowColor : null,
              shadows: [
                for (double i = 0; i < 2; i++)
                  Shadow(
                    blurRadius: (_isHovered ? 3 : 0) * i,
                    color: shadowColor,
                  ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  if (isEnabled)
                    for (double i = 1; i < 5; i++)
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: (_isHovered ? 5 : 2) * i,
                        inset: true,
                      ),
                  if (isEnabled)
                    for (double i = 1; i < 5; i++)
                      BoxShadow(
                        spreadRadius: -1,
                        color: shadowColor,
                        blurRadius: (_isHovered ? 5 : 2) * i,
                        blurStyle: BlurStyle.outer,
                      ),
                ]
              ),
              child: widget.icon
            ),
          ),
          // icon: widget.icon,
          label: Text(
            widget.label,
            style: TextStyle(
                color: isEnabled ? Colors.white : theme.disabledColor,
                shadows: [
                  if (isEnabled)
                    for (double i = 1; i < 5; i++)
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: (_isHovered ? 5 : 2) * i,
                        inset: true,
                      ),
                  if (isEnabled)
                    for (double i = 1; i < 5; i++)
                      BoxShadow(
                        spreadRadius: -1,
                        color: shadowColor,
                        blurRadius: (_isHovered ? 5 : 2) * i,
                        blurStyle: BlurStyle.outer,
                      ),
                ]
            ),
          )
        );
      }),
    ));
  }
}
