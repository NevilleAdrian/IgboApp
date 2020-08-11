import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/helpers/reset_layout.dart';
import 'package:nkuzi_igbo/screens/auth/login_screen.dart';
import 'package:nkuzi_igbo/screens/auth/password_reset_screen.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class ResetScreen extends StatefulWidget {
  static const String id = 'reset_screen';
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  Widget build(BuildContext context) {
    return ResetLayout(
      title: 'Reset',
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 67.0),
          child: Text(
            'Enter your email address you’re using for your account below and we will send you a password resent link',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  print(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return value;
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  color: kButtonColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(PasswordResetScreen.id);
                  },
                  child: Text('Request Reset Link'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginScreen.id);
                },
                child: Text(
                  'Back to login',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
