import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';

class AvatarProfileImage extends StatelessWidget {
  // final double radius;
  // final Uint8List? imageBytes;
  // final String? imageUrl;
  final ImageProvider? imageProvider;
  final bool showPlaceholder;

  const AvatarProfileImage({
    Key? key,
    // this.imageBytes,
    // this.imageUrl,
    this.imageProvider,
    this.showPlaceholder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ImageProvider? imageProvider;
    // if (imageBytes != null) {
    //   imageProvider = MemoryImage(imageBytes!);
    // } else if (imageUrl != null) {
    //   imageProvider = NetworkImage(imageUrl!);
    // }

    return CircleAvatar(
      radius: 40,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: UserAvatar(
        radius: 38,
        imageProvider: imageProvider,
        showPlaceholder: showPlaceholder,
        placeholderColor: Theme.of(context).primaryColor,
      ),
      // child: imageProvider != null
      //     ? CircleAvatar(
      //         radius: 38,
      //         backgroundImage: imageProvider,
      //         backgroundColor: Colors.grey,
      //       )
      //     : Container(
      //         width: 38 * 2,
      //         height: 38 * 2,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.grey,
      //         ),
      //         child: showPlaceholder
      //             ? Icon(Icons.person, size: 38, color: Colors.white)
      //             : null,
      //       )
    );
  }
}
