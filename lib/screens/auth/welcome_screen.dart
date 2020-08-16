import 'package:flutter/gestures.dart';
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
        image: AssetImage('$kImageUrl/nkuzi_start_bg.png'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  '$kImageUrl/logo.svg',
                  height: 100.0,
                )),
            SizedBox(
              width: double.infinity,
            ),
            Expanded(
              flex: 1,
              child: StartAuthBottom(),
            )
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 62.0),
              child: Text(
                'Your Igbo Learning made easy',
                style: kAuthTextBig,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.id);
              },
              child: Text('Start Learning'),
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
        ],
      ),
    );
  }
}
