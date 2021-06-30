import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/Exceptions/api_failure_exception.dart';
import 'package:nkuzi_igbo/helpers/auth_layout.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/auth/reset_screen.dart';
import 'package:nkuzi_igbo/screens/auth/signup_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/ui_widgets/loading_button.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  bool _loading = false;
  bool emailValid;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Login',
      authType: AuthType.Login,
      children: <Widget>[
        Form(
          key: _formKey,
          child: LoginForm(
            validator: (email) =>
                isEmailValid(_email) ? null : 'Email must be valid',
            onEmailChange: (value) {
              setState(() {
                _email = value;
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
          child: LoadingButton(
            display: Text(
              'Login',
              style: TextStyle(fontSize: 18.0),
            ),
            isLoading: _loading,
            action: () async {
              FocusManager.instance.primaryFocus.unfocus();
              if (_formKey.currentState.validate()) {
                setState(() {
                  _loading = true;
                });
                await Auth.authProvider(context)
                    .loginUser(_email, _password)
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ResetScreen.id);
                },
                child: Text('Forgot your password?'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUpScreen.id);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  final Function validator;
  LoginForm({this.onEmailChange, this.onPasswordChange, this.validator});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
            validator: validator),
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
            }
            return null;
          },
        ),
      ],
    );
  }
}
