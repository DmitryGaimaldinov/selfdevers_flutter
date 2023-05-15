import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircleUserAvatar extends StatelessWidget {
  final ImageProvider? imageProvider;
  final bool showPlaceholder;
  final double radius;

  const CircleUserAvatar({
    Key? key,
    this.imageProvider,
    this.showPlaceholder = true,
    this.radius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ImageProvider? imageProvider;
    // if (imageBytes != null) {
    //   imageProvider = MemoryImage(imageBytes!);
    // } else if (imageUrl != null) {
    //   imageProvider = NetworkImage(imageUrl!);
    // }

    final theme = Theme.of(context);

    if (imageProvider == null) {
      return Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.primaryColor,
        ),
        child: showPlaceholder
            ? Icon(
                Icons.person,
                size: radius,
                color: theme.colorScheme.onPrimary
              )
            : null,
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundImage: imageProvider,
      backgroundColor: Colors.grey,
    );
  }
}
