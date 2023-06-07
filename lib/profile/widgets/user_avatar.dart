import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class UserAvatar extends StatelessWidget {
  final ImageProvider? imageProvider;
  final bool showPlaceholder;
  final double radius;
  final String? blurhash;
  final Color? placeholderColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const UserAvatar({
    Key? key,
    this.imageProvider,
    this.showPlaceholder = true,
    this.radius = 20,
    this.blurhash,
    this.placeholderColor,
    this.backgroundColor,
    this.onTap,
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

    final borderRadius = BorderRadius.circular(radius);

    // TODO: Добавить InkWell
    // return Ink(
    //   width: radius * 2,
    //   height: radius * 2,
    //   decoration: BoxDecoration(
    //       borderRadius: borderRadius,
    //       color: theme.primaryColor,
    //       image: (imageProvider != null)
    //           ? DecorationImage(image: imageProvider!)
    //           : null
    //   ),
    //   child: (blurhash != null && imageProvider == null)
    //       ? ClipRRect(
    //           borderRadius: borderRadius,
    //           child: BlurHash(hash: blurhash!)
    //         )
    //       : Icon(
    //           Icons.person,
    //           size: radius,
    //           color: theme.colorScheme.onPrimary
    //         ),
    // );

    // TODO: Контейнер сверху делает override на ink :(((
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Ink(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          // shape: BoxShape.circle,
          color: theme.colorScheme.primary,
          image: (imageProvider != null)
              ? DecorationImage(image: imageProvider!)
              : null
        ),
        child: (blurhash != null)
            ? BlurHash(hash: blurhash!)
            : showPlaceholder
                ? Icon(
                    Icons.person,
                    size: radius,
                    color: placeholderColor ?? theme.colorScheme.onPrimary,
                  )
                : null,
      ),
    );
  }

    // return CircleAvatar(
    //   radius: radius,
    //   backgroundImage: imageProvider,
    //   backgroundColor: Colors.grey,
    // );
}
