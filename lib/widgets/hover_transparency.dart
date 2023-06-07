import 'package:flutter/material.dart';

class HoverTransparency extends StatefulWidget {
  final Widget child;

  const HoverTransparency({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<HoverTransparency> createState() => _HoverTransparencyState();
}

class _HoverTransparencyState extends State<HoverTransparency> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Opacity(
        opacity: _isHovered ? 0.8 : 1,
        child: widget.child,
      )
    );
  }
}
