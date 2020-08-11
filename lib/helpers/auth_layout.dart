import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class AuthLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const AuthLayout({this.title, this.children});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 47.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  title,
                  style: kTextHeavyWeight,
                ),
                SizedBox(
                  height: 60.0,
                ),
                OutlineButton(
                  onPressed: () {},
                  color: kGoogleBorderColor,
                  child: ExternalLogin(
                    color: Colors.black,
                    text: 'Continue with Google',
                    svgImage: 'google.svg',
                    size: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  color: kFacebookColor,
                  onPressed: () {},
                  child: ExternalLogin(
                    text: 'Continue with Facebook',
                    svgImage: 'facebook.svg',
                    iconColor: Colors.white,
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: kGoogleBorderColor,
                      ),
                    ),
                    Text(
                      'or',
                      style: kTextHeavyWeight,
                    ),
                    Expanded(
                      child: Divider(
                        height: 2.0,
                        color: kGoogleBorderColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExternalLogin extends StatelessWidget {
  final String svgImage;
  final String text;
  final Color color;
  final Color iconColor;
  final double size;
  const ExternalLogin(
      {this.text, this.svgImage, this.color, this.iconColor, this.size});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          '$kImageUrl/$svgImage',
          height: size,
          width: size,
          color: iconColor,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
