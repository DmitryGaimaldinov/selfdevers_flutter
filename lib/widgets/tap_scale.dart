import 'package:flutter/material.dart';

class TapScale extends StatefulWidget {
  final Widget child;
  final bool scaleOnTap;

  const TapScale({
    Key? key,
    required this.child,
    this.scaleOnTap = true,
  }) : super(key: key);

  @override
  State<TapScale> createState() => _TapScaleState();
}

class _TapScaleState extends State<TapScale> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.scaleOnTap) {
      return widget.child;
    }

    return Listener(
        onPointerDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onPointerUp: (_) {
        setState(() {
        _isPressed = false;
        });
      },
      child: Transform.scale(
        scale: _isPressed ? 0.95 : 1,
        child: widget.child,
      ),
    );
  }
}
