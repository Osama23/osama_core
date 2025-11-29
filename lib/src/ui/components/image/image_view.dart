// Common class which handles all type of images.

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:osama_core/osama_core.dart';

enum ImageType { asset, file, url, svg }

class ImageView extends StatelessWidget {
  final String path;
  final ImageType type;
  final String placeHolderImagePath;
  final double? height, width;
  final double? radius;
  final BoxFit? fit;
  final bool isCircular;
  final Color? backgroundColor;
  final Color? imageColor;
  final bool isVideo;
  final int? maxCacheHeight;
  final int? maxCacheWidth;
  final bool bottomRadius;
  final BoxBorder? border;
  final bool? insideList;

  const ImageView(
    this.path,
    this.type, {
    super.key,
    this.placeHolderImagePath = 'assets/images/Image_placeholder.png',
    this.height,
    this.width,
    this.isVideo = false,
    this.bottomRadius = true,
    this.fit,
    this.isCircular = false,
    this.backgroundColor,
    this.imageColor,
    this.radius,
    this.maxCacheHeight,
    this.maxCacheWidth,
    this.border,
    this.insideList = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            border: border,
            borderRadius: radius == null
                ? null
                : BorderRadius.vertical(
                    top: Radius.circular(radius ?? 0),
                    bottom: bottomRadius
                        ? Radius.circular(radius ?? 0)
                        : Radius.zero)),
        child: showImage(
            context, path, type, height, width, placeHolderImagePath, fit));
  }

  /// returns suitable Image widget.
  Widget showImage(BuildContext context, String path, ImageType type,
      double? height, double? width, String placeHolderImagePath, BoxFit? fit) {
    if (path.isNotEmpty) {
      switch (type) {
        case ImageType.svg:
          return SvgPicture.asset(
            path,
            height: height,
            width: width,
            fit: fit ?? BoxFit.scaleDown,
            colorFilter: imageColor == null
                ? null
                : ColorFilter.mode(
                    imageColor!,
                    BlendMode.srcIn,
                  ),
          );
        case ImageType.asset:
          try {
            return Image.asset(
              path,
              height: height,
              width: width,
              fit: fit,
              color: imageColor,
            );
          } catch (e) {
            return _placeHolder(
                placeHolderImagePath: placeHolderImagePath,
                height: height,
                width: width,
                fit: fit);
          }
        case ImageType.file:
          try {
            File f = File(path);
            if (f.existsSync()) {
              return Image.file(
                f,
                height: height,
                width: width,
                fit: fit,
              );
            } else {
              return _placeHolder(
                  placeHolderImagePath: placeHolderImagePath,
                  height: height,
                  width: width,
                  fit: fit);
            }
          } catch (e) {
            return _placeHolder(
                placeHolderImagePath: placeHolderImagePath,
                height: height,
                width: width,
                fit: fit);
          }
        case ImageType.url:
          try {
            if (path.contains('.svg')) {
              return SvgPicture.network(
                path,
                height: height,
                width: width,
                fit: fit ?? BoxFit.scaleDown,
                color: imageColor,
                theme: const SvgTheme(
                  currentColor: Colors.white,
                ),
              );
            }
            if (insideList == true) {
              PrecacheImages.cachImage(context, path);
            }
            return SizedBox(
              width: width,
              height: height,
              child: CachedNetworkImage(
                imageUrl: path,
                placeholder: (context, url) => loadingWidget(height, width),
                errorWidget: (context, url, error) => _placeHolder(
                    placeHolderImagePath: placeHolderImagePath,
                    height: height,
                    width: width,
                    fit: fit),
                height: height,
                fit: fit,
                fadeInDuration: Duration.zero,
                fadeOutDuration: Duration.zero,
                maxHeightDiskCache: maxCacheHeight,
                maxWidthDiskCache: maxCacheWidth,
                memCacheHeight: 500,
                memCacheWidth: 500,
              ),
              // child: OptimizedCacheImage(
              //   imageUrl: path,
              //   placeholder: (context, url) => loadingWidget(height, width),
              //   errorWidget: (context, url, error) => _placeHolder(
              //       placeHolderImagePath: placeHolderImagePath,
              //       height: height,
              //       width: width,
              //       fit: fit),
              //   height: height,
              //   fit: fit,
              //   maxHeightDiskCache: maxCacheHeight,
              //   maxWidthDiskCache: maxCacheWidth,
              //   memCacheHeight: 500,
              //   memCacheWidth: 500,
              // ),
            );
          } catch (e) {
            return _placeHolder(
                placeHolderImagePath: placeHolderImagePath,
                height: height,
                width: width,
                fit: fit);
          }
      }
    } else {
      return _placeHolder(
          placeHolderImagePath: placeHolderImagePath,
          height: height,
          width: width,
          fit: fit);
    }
  }

  /// A Placeholder widget.
  Widget _placeHolder(
      {required String placeHolderImagePath,
      double? height,
      double? width,
      BoxFit? fit}) {
    if (isVideo == true) {
      return Container();
    }
    return Image.asset(
      placeHolderImagePath,
      height: height,
      width: width,
      fit: fit,
    );
  }

  /// A loader widget
  Widget loadingWidget(double? height, double? width) {
    if (isVideo == true) {
      return const SizedBox();
    }
    return LottieBuilder.asset(
      'assets/lottie/loading_img.json',
      height: height,
      width: width,
    );
  }
}
