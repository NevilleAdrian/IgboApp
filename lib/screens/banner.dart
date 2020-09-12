import 'package:flutter/material.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0XFF9D1001),
              child: Padding(
                padding: const EdgeInsets.only(left:12, right: 20,top: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right:80.0 ),
                                  child: Text(
                                    'Subcribe today and get 20% discount to access all of our contents',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
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


                  ],
                ),
              ),
            ),
            Positioned(
              right: -9,
              bottom: -10,
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
        // NotificationList(
        //   mainText: "Phasellus dignissim, tellus",
        //   lowerText:
        //       'Duis pretium gravida enim, vel maximus ligula fermentum',
        // ),
        // SizedBox(
        //   height: 20.0,
        // ),
        // NotificationList(
        //   mainText: "Phasellus dignissim, tellus",
        //   lowerText:
        //       'Duis pretium gravida enim, vel maximus ligula fermentum',
        // )
      ],
    );
  }
}
