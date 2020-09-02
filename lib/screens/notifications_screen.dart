import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0XFF9D1001),
                    child: Padding(
                      padding: const EdgeInsets.only(left:12, right: 20,top: 30, bottom: 30),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Subcribe today and get 20% discount to access all of our contents',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text('Subscribe now', style: TextStyle(color: Color(0XFFF5A001)),)
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Text('')
                          )

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -9,
                    bottom: 5,
                    child: Container(
                      child: Image.asset(
                        "assets/images/banner.png",
                        width: 195.0,
                      ) ,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 20.0,
              ),
              NotificationList(
                mainText: "Phasellus dignissim, tellus",
                lowerText:
                    'Duis pretium gravida enim, vel maximus ligula fermentum',
              ),
              SizedBox(
                height: 20.0,
              ),
              NotificationList(
                mainText: "Phasellus dignissim, tellus",
                lowerText:
                    'Duis pretium gravida enim, vel maximus ligula fermentum',
              )
            ],
          ),
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
