import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class CircularImageView extends StatelessWidget {
  const CircularImageView({
    super.key,
    required this.width,
    required this.height,
    required this.url,
    this.type = ImageType.url,
    this.fit = BoxFit.cover,
    this.hasBorder = true,
    this.borderColor, this.borderWidth,
  });

  final double width;
  final double height;
  final String url;
  final ImageType type;
  final BoxFit fit;
  final bool hasBorder;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: !hasBorder
            ? null
            : Border.all(
                color: borderColor ?? AppColors.basicBorderColor,
                width: borderWidth ?? 1.5,
              ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
              url,
          ),
          fit: fit,
        )
      ),
    );
  }
}
