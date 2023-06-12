import 'package:flutter/material.dart';

class NeonIcon extends StatefulWidget {
  final IconData iconData;
  final Color? neonColor;

  const NeonIcon(this.iconData, {
    Key? key,
    this.neonColor,
  }) : super(key: key);

  @override
  State<NeonIcon> createState() => _NeonIconState();
}

class _NeonIconState extends State<NeonIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadowColor = widget.neonColor ?? theme.colorScheme.primary;

    return MouseRegion(
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
        child: Icon(
          widget.iconData,
        ),
      ),
    );
  }
}
