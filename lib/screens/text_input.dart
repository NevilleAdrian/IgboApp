
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
