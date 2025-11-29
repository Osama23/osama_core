import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PrecacheImages {

  PrecacheImages();

  static Future<dynamic> cachImage(BuildContext context, String? imageUrl) => precacheImage(
    CachedNetworkImageProvider(imageUrl!),
    context,
  );
}