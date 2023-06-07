import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:selfdevers/widgets/tap_scale.dart';

class NeonOutlinedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const NeonOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  State<NeonOutlinedButton> createState() => _NeonOutlinedButtonState();
}

class _NeonOutlinedButtonState extends State<NeonOutlinedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadowColor = theme.colorScheme.primary;
    final isEnabled = widget.onPressed != null;

    return TapScale(
      scaleOnTap: isEnabled,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          gradient: _isHovered
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [shadowColor, shadowColor.withOpacity(0.85)]
                )
              : null,
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
          ],
        ),
        child: TextButton(
          onPressed: widget.onPressed,
          onHover: (isHovered) => setState(() {
            _isHovered = isHovered;
          }),
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: isEnabled ? Colors.white : theme.disabledColor,
              shadows: [
                if (isEnabled)
                  for (double i = 1; i < 3; i++)
                    Shadow(
                      blurRadius: (_isHovered ? 3 : 1) * i,
                      color: shadowColor,
                    ),
              ]
            ),
            child: widget.child,
          ),
          style: TextButton.styleFrom(
            side: BorderSide(
              color: isEnabled ? Colors.white : theme.disabledColor,
              width: 1
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
            padding: EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}
