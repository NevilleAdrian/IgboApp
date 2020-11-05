import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class AppImageLoader extends StatelessWidget {
  final String image;
  final EdgeInsets margin;
  final double height;
  final double width;
  final bool hasBorder;
  AppImageLoader(
      {this.image, this.hasBorder, this.margin, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          border: hasBorder ?? false
              ? Border.all(
                  color: Colors.grey.withOpacity(0.5),
                )
              : null,
          borderRadius: hasBorder ?? false ? kAppInnerBorderRadius : null,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Image.asset('assets/images/shimmer.gif'),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

class AppNetworkImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  AppNetworkImage({this.image, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: image,
      placeholder: (context, url) => Image.asset('assets/images/shimmer.gif'),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
