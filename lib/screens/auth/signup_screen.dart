import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/Exceptions/api_failure_exception.dart';
import 'package:nkuzi_igbo/helpers/auth_layout.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/auth/login_screen.dart';
import 'package:nkuzi_igbo/ui_widgets/alt_auth_action.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

import '../home_page.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _name;
  String _email;
  String _password;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Create account',
      authType: AuthType.SignUp,
      children: <Widget>[
        Form(
          key: _formKey,
          child: SignUpForm(
            onEmailChange: (value) {
              setState(() {
                _email = value;
              });
            },
            onNameChange: (value) {
              setState(() {
                _name = value;
              });
            },
            onPasswordChange: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          width: double.infinity,
          child: FlatButton(
            child: _loading
                ? spinner(context)
                : Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18.0),
                  ),
            color: kButtonColor,
            onPressed: () async {
              FocusManager.instance.primaryFocus.unfocus();
              if (_formKey.currentState.validate()) {
                setState(() {
                  _loading = true;
                });
                await Auth.authProvider(context)
                    .registerUser(_name, _email, _password)
                    .then((_) => setState(() {
                          _loading = false;
                        }))
                    .catchError((error) {
                  setState(() {
                    _loading = false;
                  });
                  throw ApiFailureException(error);
                });
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.id, (Route<dynamic> route) => false);
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 14.0,
          ),
          child: Column(
            children: <Widget>[
              AltAuthAction(
                defaultStyle: TextStyle(
                  color: Colors.black,
                ),
                leadingText: 'By signing up, you agree to our ',
                leadingStyle: TextStyle(color: kGoogleBorderColor),
                actionText: 'Terms of Service and Privacy Policy',
                actionStyle: TextStyle(fontWeight: FontWeight.w600),
                onTap: () {},
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginScreen.id);
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                ],
              ),
              // AltAuthAction(
              //   defaultStyle: TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.w200,
              //   ),
              //   leadingText: 'Have an account? ',
              //   actionText: 'Log in',
              //   actionStyle: TextStyle(
              //     decoration: TextDecoration.underline,
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pushNamed(LoginScreen.id);
              //   },
              // ),
            ],
          ),
        )
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  final Function onNameChange;
  final Function onEmailChange;
  final Function onPasswordChange;
  SignUpForm({this.onEmailChange, this.onNameChange, this.onPasswordChange});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          key: Key('name'),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Name',
            labelText: 'Name',
          ),
          onChanged: (value) {
            onNameChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          key: Key('email'),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
          ),
          onChanged: (value) {
            onEmailChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          key: Key('password'),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password (Minimum 6 characters)',
            labelText: 'Password',
          ),
          onChanged: (value) {
            onPasswordChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            } else if (value.length < 6) {
              return 'Password should be at least six characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
