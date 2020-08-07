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
        title:  Text( 'Categories', style: TextStyle( color: Colors.black, fontWeight: FontWeight.w600,  fontFamily: 'Poppins'),),
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
                children: <Widget>[
                  Container(color: Colors.grey , height: 0.3),
                  SizedBox(
                    height: 15.0,
                  )

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


