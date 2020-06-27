import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swipe_solution/primary_progress_indicator.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final bool isRound;
  final double radius;
  final double height;
  final double width;
  final bool isAsset;
  final BoxFit fit;

  CachedImage(
    this.imageUrl, {
    this.isRound = false,
    this.radius = 0,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(
        height: isRound ? radius : height,
        width: isRound ? radius : width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: isAsset
              ? Image.asset(imageUrl, fit: BoxFit.cover)
              : imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      progressIndicatorBuilder: (context, s, progress) =>
                          PrimaryProgressIndicator(
                        value: progress.totalSize != null
                            ? progress.downloaded / progress.totalSize
                            : null,
                      ),
                      fit: fit,
                      placeholder: (context, url) => PrimaryProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          NoImagePlaceholder(),
                    )
                  : NoImagePlaceholder(),
        ),
      );
    } catch (e) {
      print(e);
      return NoImagePlaceholder();
    }
  }
}

class NoImagePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/no_image.png", fit: BoxFit.cover);
  }
}
