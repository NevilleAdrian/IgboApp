import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding (
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Settings', style: TextStyle( color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30.0,),
                Text('GENERAL', style: TextStyle( color: Colors.grey, fontSize: 14.0),),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/email.svg"),
                    SizedBox(width: 20.0,),
                    Text('Change Email', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/padlocks.svg"),
                    SizedBox(width: 26.0,),
                    Text('Change Password', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/notifications.svg"),
                    SizedBox(width: 20.0,),
                    Text('Notification Settings', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30.0,),
                Text('APPLICATION', style: TextStyle( color: Colors.grey, fontSize: 14.0),),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/about.svg"),
                    SizedBox(width: 20.0,),
                    Text('About Nkuzi Igbo', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/document.svg"),
                    SizedBox(width: 20.0,),
                    Text('Term of Service', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/comment.svg"),
                    SizedBox(width: 20.0,),
                    Text('Send Feedback', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/update.svg"),
                    SizedBox(width: 20.0,),
                    Text('Check for Update', style: TextStyle(color: Colors.black, fontSize: 15),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/logout.svg"),
                    SizedBox(width: 20.0,),
                    Text('Logout', style: TextStyle(color: Color(0XFFF21600), fontSize: 15),)
                  ],
                ),
              ],
            )

          ],
        ),
      )
    );
  }
}
