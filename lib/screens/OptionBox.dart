
import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({
    @required this.option,
    this.color,
    this.gradient1,
    this.gradient2

  }) ;

  final String option;
  final Color color;
  final Color gradient1;
  final Color gradient2;



  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [gradient1, gradient2]),
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(-1, 1), // changes position of shadow
              ),
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 5.0),
          child: Text(option,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 12),),
        )
    );
  }
}
