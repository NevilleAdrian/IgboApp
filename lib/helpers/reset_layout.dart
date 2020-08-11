import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class ResetLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ResetLayout({this.title, this.children});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                title,
                style: kTextHeavyWeight,
              ),
              SizedBox(
                height: 20.0,
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
