import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/helpers/reset_layout.dart';
import 'package:nkuzi_igbo/screens/auth/reset_success.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class PasswordResetScreen extends StatefulWidget {
  static const String id = 'password_reset_screen';
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return ResetLayout(
      title: 'Reset',
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ResetForm(),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  color: kButtonColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(ResetSuccess.id);
                  },
                  child: Text('Reset my password'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ResetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Confirm password',
            labelText: 'Confirm password',
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
