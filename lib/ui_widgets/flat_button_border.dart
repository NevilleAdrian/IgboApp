import 'package:flutter/material.dart';

class FlatButtonBorder extends StatelessWidget {
  final Color textColor;
  final Color color;
  final Color borderColor;
  final String text;
  const FlatButtonBorder(
      {this.textColor, this.color, @required this.text, this.borderColor});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Text(text),
      textColor: textColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
