import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/change_password.dart';
import 'package:nkuzi_igbo/screens/profile_screen.dart';
import 'package:nkuzi_igbo/screens/splash_screen.dart';
import 'package:nkuzi_igbo/screens/static/about_page.dart';
import 'package:nkuzi_igbo/screens/static/terms_page.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: <Widget>[
                  SizedBox(child: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      'Settings',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Baloo',
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 20.0),
                    ),
                  )
                ],
              )),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'GENERAL',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/images/padlocks.svg"),
                      SizedBox(
                        width: 26.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword()),
                          );
                        },
                        child: Text(
                          'Change Password',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     SvgPicture.asset("assets/images/notifications.svg"),
                  //     SizedBox(
                  //       width: 20.0,
                  //     ),
                  //     Text(
                  //       'Notification Settings',
                  //       style: TextStyle(color: Colors.black, fontSize: 15),
                  //     )
                  //   ],
                  // ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'APPLICATION',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AboutPage.id);
                    },
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/images/about.svg"),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'About Nkuzi Igbo',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(TermsPage.id);
                    },
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/images/document.svg"),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Term of Service',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/images/comment.svg"),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Send Feedback',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     SvgPicture.asset("assets/images/update.svg"),
                  //     SizedBox(
                  //       width: 20.0,
                  //     ),
                  //     Text(
                  //       'Check for Update',
                  //       style: TextStyle(color: Colors.black, fontSize: 15),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/images/logout.svg"),
                      SizedBox(
                        width: 20.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Auth.authProvider(context).logout();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SplashScreen.id, (route) => false);
                        },
                        child: Text(
                          'Logout',
                          style:
                              TextStyle(color: Color(0XFFF21600), fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
