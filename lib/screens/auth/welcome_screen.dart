import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/helpers/background_image_container.dart';
import 'package:nkuzi_igbo/screens/auth/login_screen.dart';
import 'package:nkuzi_igbo/screens/auth/signup_screen.dart';
import 'package:nkuzi_igbo/ui_widgets/alt_auth_action.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'auth_start_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageContainer(
        padding: EdgeInsets.only(top: 70.0, bottom: 40.0),
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
        image: AssetImage('$kImageUrl/onboarding.png'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              '$kImageUrl/logo.svg',
              height: 100.0,
            ),
            SizedBox(
              width: double.infinity,
            ),
            StartAuthBottom()
          ],
        ),
      ),
    );
  }
}

class StartAuthBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[
          Text(
            'Your Igbo Learning\nmade easy',
            style: kAuthTextBig.copyWith(
                fontFamily: 'Baloo', fontWeight: FontWeight.w900, height: 1),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.id);
              },
              child: Text(
                'Start Learning',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AltAuthAction(
            defaultStyle: kAuthTextSmall,
            leadingText: 'Have an account? ',
            actionText: 'Log in',
            actionStyle:
                kAuthTextSmall.copyWith(decoration: TextDecoration.underline),
            onTap: () {
              Navigator.of(context).pushNamed(LoginScreen.id);
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
