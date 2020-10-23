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
          // overflow: Overflow.visible,
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
                                  padding: const EdgeInsets.only(right:120.0 ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Subcribe today and get',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 11.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      Text(
                                            '20% discount to access all of our contents',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                SizedBox(height: 10),
                                Text('Subscribe now', style: TextStyle(color: Color(0XFFF5A001 ), fontSize: 12),)
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
              bottom: -12,
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
