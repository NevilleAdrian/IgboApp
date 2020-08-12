import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/screens/auth/login_screen.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class ResetSuccess extends StatelessWidget {
  static const String id = 'reset_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 47.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Successful password reset!',
                style: kTextHeavyWeight,
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'You can now use your new password to log in to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  color: kButtonColor,
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.id, (Route<dynamic> route) => false);
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
