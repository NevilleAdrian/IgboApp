import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

String replaceBackSlash(String url) =>
    url?.replaceAll('\\', '/')?.replaceAll(' ', '%20') ?? null;

bool isNullOrEmpty(String text) => text == null || text.trim() == '';

bool shouldShow(String question) =>
    !isNullOrEmpty(question) && !question.contains('#');

String replaceRemoteImageWithLocal(String url) =>
    url
        ?.replaceAll(
            'https://nkuziigbo.herokuapp.com/igboapp/upload/', kImageRemoteUrl)
        ?.replaceAll(
            'http://nkuziigbo.herokuapp.com/igboapp/upload/', kImageRemoteUrl)
        ?.replaceAll(
            'https://infomall-001-site1.etempurl.com/assets/', kImageRemoteUrl)
        ?.replaceAll(
            'https://infomall-001-site1.etempurl.com/assets\\', kImageRemoteUrl)
        ?.replaceAll(' ', '_') ??
    null;

String replaceRemoteAudioWithLocal(String url) =>
    url
        ?.replaceAll(
            'https://nkuziigbo.herokuapp.com/igboapp/upload/', kAudioRemoteUrl)
        ?.replaceAll(
            'http://nkuziigbo.herokuapp.com/igboapp/upload/', kAudioRemoteUrl)
        ?.replaceAll(
            'https://infomall-001-site1.etempurl.com/assets/', kAudioRemoteUrl)
        ?.replaceAll(
            'https://infomall-001-site1.etempurl.com/assets\\', kAudioRemoteUrl)
        ?.replaceAll(' ', '_') ??
    null;

bool isEmailValid(String email) {
  RegExp regex;
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  if (email != null) {
    regex = RegExp(pattern);
  }

  print('bool: ${regex.hasMatch(email)}');
  return regex.hasMatch(email);
}

Widget spinner(BuildContext context) {
  return CircularProgressIndicator(
    strokeWidth: 2,
    backgroundColor: Colors.white,
    valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
  );
}
