import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/helpers/auth_layout.dart';
import 'package:nkuzi_igbo/screens/auth/reset_screen.dart';
import 'package:nkuzi_igbo/screens/auth/signup_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/ui_widgets/alt_auth_action.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Login',
      children: <Widget>[
        LoginForm(),
        SizedBox(
          height: 30.0,
        ),
        Container(
          width: double.infinity,
          child: FlatButton(
            color: kButtonColor,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomePage.id, (Route<dynamic> route) => false);
            },
            child: Text('Login'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 14.0,
          ),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ResetScreen.id);
                },
                child: Text('Forgot your password?'),
              ),
              SizedBox(
                height: 10.0,
              ),
              AltAuthAction(
                defaultStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
                leadingText: 'New? ',
                actionText: 'Sign up',
                actionStyle: TextStyle(decoration: TextDecoration.underline),
                onTap: () {
                  Navigator.of(context).pushNamed(SignUpScreen.id);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
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
          height: 10.0,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password (Minimum 6 characters)',
            labelText: 'Password',
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
      ],
    );
  }
}
