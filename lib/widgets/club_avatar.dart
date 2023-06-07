import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ClubAvatar extends StatelessWidget {
  final ImageProvider? imageProvider;
  final String? blurhash;
  final double radius;
  final void Function()? onTap;

  const ClubAvatar({
    Key? key,
    this.imageProvider,
    this.blurhash,
    this.radius = 20,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(radius / 2);

    return InkWell(
      onTap: onTap,
      child: Ink(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: theme.primaryColor,
          image: (imageProvider != null)
              ? DecorationImage(image: imageProvider!)
              : null
        ),
        child: (blurhash != null && imageProvider == null)
            ? ClipRRect(
                borderRadius: borderRadius,
                child: BlurHash(hash: blurhash!)
              )
            : null,
      ),
    );
    // }

    // return CircleAvatar(
    //   radius: radius,
    //   backgroundImage: imageProvider,
    //   backgroundColor: Colors.grey,
    // );
  }
}
