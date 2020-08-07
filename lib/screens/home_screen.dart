import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomeScreen extends StatefulWidget {

  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text( 'Categories', style: TextStyle( fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600,  fontFamily: 'Poppins'),),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset("assets/images/search.svg",
                color: Colors.black
            ),
          ),
        ],
        
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(color: Colors.grey , height: 0.3),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    child: Card(
                      color: Color(0XFF47C1ED) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mkpuru Osisi', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(height: 5,),
                            Text('Fruits', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: Color(0XFFAA91C2) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Aha Umuanumanu ', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(height: 5,),
                            Text('Names of Animal', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: Color(0XFF2F78CA) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mkpuru Osisi', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(height: 5,),
                            Text('Fruits', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: Color(0XFFD13631) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Aha Umuanumanu ', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(height: 5,),
                            Text('Names of Animal', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: Color(0XFF2D0C06) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mkpuru Osisi', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(height: 5,),
                            Text('Fruits', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: Color(0XFFF7B500) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Aha Umuanumanu ', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(height: 5,),
                            Text('Names of Animal', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


