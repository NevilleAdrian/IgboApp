import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/banner.dart';
import 'package:nkuzi_igbo/screens/settings.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Notification',
            style: kAuthTextBig.copyWith(
                fontFamily: 'Baloo', fontWeight: FontWeight.w900, color: Colors.black, fontSize: 25.0),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: SvgPicture.asset("assets/images/settings.svg",
                    color: Colors.black),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
          child: NotificationBanner(),
        ),
      ),
    );
  }
}


class NotificationList extends StatelessWidget {
  const NotificationList({this.mainText, this.lowerText});
  final String mainText;
  final String lowerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(mainText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        SizedBox(
          height: 5.0,
        ),
        Text(
          lowerText,
          style: TextStyle(fontSize: 11),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          color: Colors.grey,
          height: 0.2,
        )
      ],
    );
  }
}
