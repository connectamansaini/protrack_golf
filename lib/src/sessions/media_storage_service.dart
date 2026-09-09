import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// Infrastructure service that copies a picked photo/video into the app's
/// own documents directory so the path stays valid across app restarts,
/// independent of wherever the OS picker's cache file lived.
class MediaStorageService {
  const MediaStorageService();

  Future<String> persist(XFile file) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final mediaDir = Directory('${docsDir.path}/session_media');
    if (!mediaDir.existsSync()) {
      mediaDir.createSync(recursive: true);
    }
    final fileName = '${DateTime.now().microsecondsSinceEpoch}_${file.name}';
    final destination = '${mediaDir.path}/$fileName';
    await File(file.path).copy(destination);
    return destination;
  }
}
