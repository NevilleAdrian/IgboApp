import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: "Poppins",
    primaryColor: PRIMARY,
    accentColor: ACCENT,
    buttonColor: PRIMARY,
    textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    primaryTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    accentTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
//    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFFF7F7FB),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF4380FF), width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFF7F7FB), width: 0.5),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFFFF6D67),
      height: 50,
      // minWidth: double.infinity,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    ),
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      elevation: 2,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
