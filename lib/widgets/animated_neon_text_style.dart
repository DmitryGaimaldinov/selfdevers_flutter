import 'package:flutter/material.dart';

class AnimatedNeonTextStyle extends StatefulWidget {
  final Widget child;

  const AnimatedNeonTextStyle({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AnimatedNeonTextStyle> createState() => _AnimatedNeonTextStyleState();
}

class _AnimatedNeonTextStyleState extends State<AnimatedNeonTextStyle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          shadows: [
            if (!_isHovered)
              Shadow(
                blurRadius: 20,
                color: Colors.white,
              ),
            if (_isHovered)
              for (double i = 1; i < 5; i++)
                Shadow(
                  blurRadius: 3 * i,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ]
        ),
        child: widget.child,
      ),
    );
  }
}
