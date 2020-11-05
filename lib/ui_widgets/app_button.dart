import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  final BorderRadius borderRadius;

  const AppButton({this.padding, @required this.child, this.borderRadius});
  @override
  Widget build(BuildContext context) {
    final EdgeInsets setPadding =
        padding ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0);

    return ButtonTheme(
      padding: setPadding, //adds padding inside the button
      materialTapTargetSize: MaterialTapTargetSize
          .shrinkWrap, //limits the touch area to the button area
      minWidth: 0, //wraps child's width
      textTheme: ButtonTextTheme.primary,
      height: 0, //wraps child's height
      child: child,
    );
  }
}
