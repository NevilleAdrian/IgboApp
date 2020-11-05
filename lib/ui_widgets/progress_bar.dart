import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double width;
  const ProgressBar({this.width});
  double getWidth(double parentWidth, double width) {
    return parentWidth * width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0XFFEDEDED),
            ),
            height: 6,
            width: constraints.maxWidth,
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.redAccent),
                  height: 6,
                  width: getWidth(constraints.maxWidth, width),
                ),
              ),
            ));
      },
    );
  }
}
