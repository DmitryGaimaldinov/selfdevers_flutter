import 'package:path/path.dart' as path;

class PhotoUtils {
  static bool isSupportedExtension(String extension) {
    print('extension: $extension');

    return extension == '.jpg' ||
        extension == '.jpeg' ||
        extension == '.png' ||
        extension == '.webp'
    ;
  }
}