import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  final Widget child;

  const FrostedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [theme.colorScheme.surface.withOpacity(0.8), theme.colorScheme.surface.withOpacity(0.3)]
        ),
      ),
      child: child,
    );
  }
}
