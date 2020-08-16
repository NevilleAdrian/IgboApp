import 'package:flutter/material.dart';

const Color PRIMARY = Color(0xFFFF6D67);
const Color ACCENT = Color(0xFF4380FF);
const Color kButtonColor = Color(0xFFF21600);
const Color kGoogleBorderColor = Color(0xFF70707024);
const Color kFacebookColor = Color(0xFF1976D2);
const Color kTextColor = Colors.white;
const TextStyle kTextHeavyWeight = TextStyle(fontWeight: FontWeight.w600);
const String kImageUrl = 'assets/images';
const TextStyle kAuthTextBig = TextStyle(color: kTextColor, fontSize: 25.0);
const TextStyle kAuthTextSmall = TextStyle(color: kTextColor, fontSize: 15.0);

//app url
const String kAppAPIUrl = 'https://nkuziigbo.herokuapp.com';

Map<String, String> _headers(String token) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Authorization": "Bearer $token"
  };
}

const Function kHeaders = _headers;
