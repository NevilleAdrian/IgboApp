import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundImageContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool hasShadow;
  final Color shadowColor;
  final ImageProvider<dynamic> image;
  const BackgroundImageContainer(
      {this.child,
      this.image,
      this.margin,
      this.width,
      this.height,
      this.padding,
      this.hasShadow = false,
      this.shadowColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(-1, 1), // changes position of shadow
                ),
              ]
            : null,
      ),
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: child,
    );
  }
}
