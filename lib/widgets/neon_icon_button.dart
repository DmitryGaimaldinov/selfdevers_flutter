import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:selfdevers/widgets/tap_scale.dart';

class NeonIconButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final Color? neonColor;
  final Color? hoverColor;
  final Color? focusColor;

  const NeonIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.neonColor,
    this.hoverColor,
    this.focusColor,
  }) : super(key: key);

  @override
  State<NeonIconButton> createState() => _NeonIconButtonState();
}

class _NeonIconButtonState extends State<NeonIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadowColor = widget.neonColor ?? theme.colorScheme.primary;
    final isEnabled = widget.onPressed != null;

    return TapScale(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: IconTheme.merge(
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
          child: IconButton(
            onPressed: widget.onPressed,
            icon: widget.icon,
            hoverColor: widget.hoverColor,
            focusColor: widget.focusColor,
          ),
        ),
      ),
    );
  }
}
