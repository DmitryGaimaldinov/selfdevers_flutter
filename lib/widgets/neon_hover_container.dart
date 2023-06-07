import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeonHoverContainer extends StatefulWidget {
  final Widget child;
  final BorderRadius? borderRadius;

  const NeonHoverContainer({
    Key? key,
    required this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<NeonHoverContainer> createState() => _NeonHoverContainerState();
}

class _NeonHoverContainerState extends State<NeonHoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          boxShadow: [
            if (_isHovered)
              for (double i = 1; i < 5; i++)
                BoxShadow(
                  color: shadowColor,
                  blurRadius: (_isHovered ? 3 : 0) * i,
                  inset: true,
                ),
            if (_isHovered)
              for (double i = 1; i < 5; i++)
                BoxShadow(
                  spreadRadius: -1,
                  color: shadowColor,
                  blurRadius: (_isHovered ? 3 : 0) * i,
                  blurStyle: BlurStyle.outer,
                ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
