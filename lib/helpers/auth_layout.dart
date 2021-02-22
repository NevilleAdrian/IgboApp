import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:nkuzi_igbo/Exceptions/api_failure_exception.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/ui_widgets/loading_button.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

enum AuthType { SignUp, Login }

class AuthLayout extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final AuthType authType;
  const AuthLayout({this.title, this.children, this.authType});

  @override
  _AuthLayoutState createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  bool _isBusy = false;
  bool _isGoogleBusy = false;

  Future<void> _onGoogleSignIn() async {
    try {
      _isGoogleBusy = true;
      var res = await _googleSignIn.signIn();
      _isGoogleBusy = false;
      if (res == null) {
        _showError(context, 'An error occurred during the sign in process');
      } else {
        await _sendDetailsToServer(context, res.displayName, res.email);
      }
      print(res);
    } catch (error) {
      print(error);
      _isGoogleBusy = false;
      _showError(context, error);
    }
  }

  Future<void> _onFacebookLogin(BuildContext context) async {
    final facebookLogin = FacebookLogin();
    setState(() {
      _isBusy = true;
    });
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        String token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
        final profile = jsonDecode(graphResponse.body);
        await _sendDetailsToServer(context, profile['name'], profile['email']);
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showError(context, 'Authentication flow canceled by you.');
        break;
      case FacebookLoginStatus.error:
        _showError(context, result.errorMessage);
        break;
    }
  }

  Future<void> _authAction(
      BuildContext context, String name, String email) async {
    if (widget.authType == AuthType.SignUp) {
      return await Auth.authProvider(context)
          .registerUser(name, email, 'password');
    } else {
      return await Auth.authProvider(context).loginUser(email, 'password');
    }
  }

  Future<void> _sendDetailsToServer(
      BuildContext context, String name, String email) async {
    await _authAction(context, name, email)
        .then((_) => setState(() {
              _isBusy = false;
              _navigateToHome(context);
            }))
        .catchError((error) {
      setState(() {
        _isBusy = false;
        _showError(context, error);
      });
    });
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomePage.id, (Route<dynamic> route) => false);
  }

  void _showError(BuildContext context, message) {
    setState(() {
      _isBusy = false;
    });
    throw new ApiFailureException(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 47.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: kTextHeavyWeight,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                LoadingButton(
                  isFlat: false,
                  action: () async {
                    setState(() {
                      _isGoogleBusy = true;
                    });
                    await _onGoogleSignIn();
                    setState(() {
                      _isGoogleBusy = false;
                    });
                  },
                  isLoading: _isGoogleBusy,
                  color: kGoogleBorderColor,
                  display: ExternalLogin(
                    color: Colors.black,
                    text: 'Continue with Google',
                    svgImage: 'google.svg',
                    size: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                LoadingButton(
                  isLoading: _isBusy,
                  action: () async {
                    setState(() {
                      _isBusy = true;
                    });
                    await _onFacebookLogin(context);
                    setState(() {
                      _isBusy = false;
                    });
                  },
                  color: kFacebookColor,
                  display: ExternalLogin(
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
                ...widget.children,
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
          '$kImageUrl/${svgImage}',
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
