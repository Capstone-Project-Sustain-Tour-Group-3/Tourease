import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.imageBuilder,
    this.placeholder,
    this.errorWidget,
    this.fit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      placeholder: placeholder ??
          (context, url) => Shimmer.fromColors(
                baseColor: ColorNeutral.neutral50,
                highlightColor: ColorNeutral.neutral300,
                child: Container(
                  color: ColorNeutral.neutral300,
                ),
              ),
      errorWidget: errorWidget ??
          (context, url, error) => Icon(
                Icons.error,
                color: ColorNeutral.neutral50,
                size: 40,
              ),
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
