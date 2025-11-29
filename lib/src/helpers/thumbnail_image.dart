import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ThumbnailImageLoader {
  static Future<File?> getImageThumbnail(String url) async {
    final CacheManager cacheManager = CacheManager(
        Config('imageCacheKey', stalePeriod: const Duration(minutes: 5)));
    var file = await cacheManager.downloadFile(url,
        key: DateTime.now().millisecondsSinceEpoch.toString());
    // LoggingService().logMessage('Image downloaded successfully', className: 'ThumbnailGenerator');
    return file.file;
  }
}