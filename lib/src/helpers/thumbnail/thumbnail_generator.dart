import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:network_manager/network_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class ThumbnailGenerator {
  static const String videoThumbnailMap = 'kVideoThumbnailMap';
  final int thumbnailQuality = 10;
  final int thumbnailMaxHeight = 500;
  final int thumbnailMaxWidth = 400;

  final int shareVideoThumbnailMaxHeight = 400;
  final int shareVideoThumbnailMaxWidth = 400;
  final int shareVideoThumbnailQuality = 80;
  final int thumbnailFirstFrameMs = 2000;

  static final ThumbnailGenerator _instance = ThumbnailGenerator._();
  Map<String, String> _videoThumbnailPathMap = {};
  final PreferencesUtil _appPreferenceHelper = PreferencesUtil();
  String? directoryPath;

  ThumbnailGenerator._() {
    _loadVideoThumbnailMap();
  }

  static ThumbnailGenerator get() => _instance;

  Future<void> init() async {
    directoryPath = (await getTemporaryDirectory()).path;
  }

  Future<File?> getThumbnailFileForVideoUrl(
    String? videoUrl, {
    int? maxThumbnailHeight,
    int? maxThumbnailWidth,
    int? thumbnailQuality,
  }) async {
    debugPrint('********** $videoUrl');
    File? thumbnailFile;
    if (videoUrl != null && videoUrl.isNotEmpty) {
      String? thumbnailFilePath = _getVideoThumbnailFileUrlFromMap(videoUrl);
      debugPrint('********** File path from cache $thumbnailFilePath');
      thumbnailFile = await _getThumbnailFile(thumbnailFilePath);
      if (thumbnailFile == null) {
        debugPrint('********** generating thumbnail');
        thumbnailFilePath = await _generateThumbnailFromVideoUrl(videoUrl,
            maxThumbnailHeight: maxThumbnailHeight,
            maxThumbnailWidth: maxThumbnailWidth,
            thumbnailQuality: thumbnailQuality);
        thumbnailFile = await _getThumbnailFile(thumbnailFilePath);
        debugPrint('********** File path generated $thumbnailFilePath');
        if (thumbnailFile != null) {
          _updateVideoThumbnailFileUrlToMap(videoUrl, thumbnailFilePath);
        }
      }
    }
    return thumbnailFile;
  }

  Future<File?> getShareThumbnailFileForVideoUrl(String? videoUrl) async {
    debugPrint('********** $videoUrl');
    File? thumbnailFile;
    if (videoUrl != null && videoUrl.isNotEmpty) {
      String? thumbnailFilePath;
      debugPrint('********** generating thumbnail');
      thumbnailFilePath = await _generateThumbnailFromVideoUrl(videoUrl,
          maxThumbnailWidth: shareVideoThumbnailMaxWidth,
          maxThumbnailHeight: shareVideoThumbnailMaxHeight,
          thumbnailQuality: shareVideoThumbnailQuality);
      thumbnailFile = await _getThumbnailFile(thumbnailFilePath);
      debugPrint('********** File path generated $thumbnailFilePath');
    }
    return thumbnailFile;
  }

  Future<String?> _generateThumbnailFromVideoUrl(String url,
      {int? maxThumbnailHeight,
      int? maxThumbnailWidth,
      int? thumbnailQuality}) async {
    if (directoryPath == null) {
      await init();
    }
    try {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: url,
        thumbnailPath: directoryPath,
        imageFormat: ImageFormat.JPEG,
        quality: thumbnailQuality ?? this.thumbnailQuality,
        maxWidth: maxThumbnailWidth ?? thumbnailMaxWidth,
        maxHeight: maxThumbnailHeight ?? thumbnailMaxHeight,
        timeMs: thumbnailFirstFrameMs,
      );
      if (fileName == null) {
        // LoggingService().fine(
        //     'Thumbnail Generator', 'File Path for video url $url is null',
        //     methodName: 'generateFromVideo', className: 'ThumbnailGenerator');
        return null;
      }
      return fileName;
    } catch (error) {
      // LoggingService().shout(
      //     'Thumbnail Generator', 'Error while generating thumbnail',
      //     error: error,
      //     methodName: 'generateFromVideo',
      //     className: 'ThumbnailGenerator');
      return null;
    }
  }

  Future<File?> _getThumbnailFile(String? thumbnailFilePath) async {
    if (thumbnailFilePath == null || thumbnailFilePath.isEmpty) {
      return null;
    }
    final file = File(thumbnailFilePath);
    return file.existsSync() ? file : null;
  }

  void deleteVideoThumbnailUrlForUnlikedVideo(String? videoUrl) {
    _removeThumbnailFileUrlFromMap(videoUrl);
  }

  String? _getVideoThumbnailFileUrlFromMap(String? videoUrl) {
    if (videoUrl == null || videoUrl.isEmpty) {
      return null;
    }
    return _videoThumbnailPathMap[videoUrl];
  }

  void _updateVideoThumbnailFileUrlToMap(
      String? videoUrl, String? thumbnailPath) {
    if (videoUrl != null &&
        videoUrl.isNotEmpty &&
        thumbnailPath != null &&
        thumbnailPath.isNotEmpty) {
      _videoThumbnailPathMap[videoUrl] = thumbnailPath;
      _cacheVideoThumbnailMap();
    }
  }

  void _removeThumbnailFileUrlFromMap(String? videoUrl) {
    if (videoUrl != null && videoUrl.isNotEmpty) {
      _videoThumbnailPathMap.remove(videoUrl);
      _cacheVideoThumbnailMap();
    }
  }

  void _loadVideoThumbnailMap() {
    String videoThumbnailMapString =
        _appPreferenceHelper.getString(videoThumbnailMap, defaultValue: '');
    try {
      debugPrint('********** Loading Map from Shared Preferences');
      _videoThumbnailPathMap =
          // ignore: inference_failure_on_function_invocation
          Map.castFrom(jsonDecode(videoThumbnailMapString));
      // LoggingService().logMessage(videoThumbnailMapString,
      //     methodName: '_cacheVideoThumbnailMap',
      //     className: 'ThumbnailGenerator');
    } catch (error) {
      // LoggingService().shout(
      //     'Json Decode and get map form Shared Preferences', error.toString(),
      //     error: error);
    }
  }

  void _cacheVideoThumbnailMap() async {
    if (_videoThumbnailPathMap.isNotEmpty) {
      try {
        String mapString = jsonEncode(_videoThumbnailPathMap);
        // LoggingService().logMessage(mapString,
        //     methodName: '_cacheVideoThumbnailMap',
        //     className: 'ThumbnailGenerator');
        _appPreferenceHelper.setString(videoThumbnailMap, value: mapString);
      } catch (error) {
        // LoggingService().shout(
        //     'Json Encode and Enter map in Shared Preferences', error.toString(),
        //     error: error);
      }
    }
  }

  Future<File?> getImageThumbnail(String url) async {
    final CacheManager cacheManager = CacheManager(
        Config('imageCacheKey', stalePeriod: const Duration(minutes: 5)));
    var file = await cacheManager.downloadFile(url,
        key: DateTime.now().millisecondsSinceEpoch.toString());
    // LoggingService().logMessage('Image downloaded successfully', className: 'ThumbnailGenerator');
    return file.file;
  }
}
