import 'package:flutter/material.dart';

const Color kPrimary = Color(0xFFF21600);
const Color kAccent = Color(0xFF4380FF);
const Color kButtonColor = kPrimary;
const Color kGoogleBorderColor = Color(0xFF70707024);
const Color kFacebookColor = Color(0xFF1976D2);
const Color kTextColor = Colors.white;
const TextStyle kTextHeavyWeight = TextStyle(fontWeight: FontWeight.w600);
const String kImageUrl = 'assets/images';
const TextStyle kAuthTextBig = TextStyle(color: kTextColor, fontSize: 25.0);
const TextStyle kAuthTextSmall = TextStyle(color: kTextColor, fontSize: 18.0);

const BorderRadius kAppBorderRadius = BorderRadius.all(Radius.circular(10.0));

const BorderRadius kAppCircle = BorderRadius.all(Radius.circular(50.0));
const BorderRadius kAppBorderRadiusMini =
    BorderRadius.all(Radius.circular(5.0));
const BorderRadius kAppBorderRadiusSemi =
    BorderRadius.all(Radius.circular(8.0));
const BorderRadius kAppInnerBorderRadius =
    BorderRadius.all(Radius.circular(25.0));
const BorderRadius kAppInnerBorderPartialRadius = BorderRadius.only(
  topRight: Radius.circular(10.0),
  bottomRight: Radius.circular(10.0),
);

//app url
const String kAppAPIUrl = 'https://nkuziigbo.herokuapp.com/igboapp/api';

Map<String, String> _headers(String token) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Authorization": "Bearer $token"
  };
}

const kHeaders = _headers;

const String kUserName = 'user';
const String kAppDataName = 'appData';
const String kCategory = 'category';

const List<String> kIrregularStudies = [
  'vowel harmony',
  'vowels',
  'consonants',
  'african rosewood leave soup'
];
