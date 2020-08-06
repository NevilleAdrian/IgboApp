import 'package:flutter/material.dart';


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
        title: Text('Activities'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search)
          ),
        ],
         leading: Padding(
           padding: const EdgeInsets.only(left: 20),
           child: Text('Categories', style: TextStyle(),),
         ) ,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                Container(color: Color(0XFFEDEDED), height: 1),
                SizedBox(
                  height: 15.0,
                )

              ],
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


