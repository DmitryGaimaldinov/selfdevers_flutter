import 'package:flutter/material.dart';
import 'package:selfdevers/widgets/hover_transparency.dart';
import 'package:selfdevers/widgets/tap_scale.dart';

class NoteActionButton extends StatefulWidget {
  final Color? hoverColor;
  final void Function()? onPressed;
  final IconData iconData;
  final String? label;
  final Color? contentColor;

  const NoteActionButton({
    Key? key,
    required this.onPressed,
    // required this.child,
    // required this.childOnHover,
    this.hoverColor,
    required this.iconData,
    this.label,
    this.contentColor,
  }) : super(key: key);

  @override
  State<NoteActionButton> createState() => _NoteActionButtonState();
}

class _NoteActionButtonState extends State<NoteActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color hoverColor = (_isHovered && widget.hoverColor != null)
        ? widget.hoverColor!
        : (widget.contentColor != null)
            ? widget.contentColor!
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.7);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TapScale(
        scaleOnTap: widget.onPressed != null,
        child: IconButton(
          onPressed: widget.onPressed,
          color: hoverColor,
          icon: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                widget.iconData,
                color: hoverColor,
                size: 15,
              ),
              if (widget.label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.label!,
                    style: TextStyle(color: hoverColor, fontSize: 15),
                  ),
                ),
            ],
          ),
          hoverColor: widget.hoverColor?.withOpacity(0.2),
          focusColor: widget.hoverColor?.withOpacity(0.2),
        ),
      ),
    );
  }
}
