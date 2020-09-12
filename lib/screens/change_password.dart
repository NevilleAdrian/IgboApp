import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                SizedBox(
                    child: Icon(Icons.arrow_back)
                ),
                SizedBox(width: 10.0,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Settings',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontFamily: 'Baloo', fontWeight: FontWeight.w900, color: Colors.black, fontSize: 20.0),
                  ),
                )
              ],
            )
        ),
        elevation: 0,
      ),
    );
  }
}
