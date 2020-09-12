import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/screens/text_input.dart';

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
                    'Change Password',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontFamily: 'Baloo', fontWeight: FontWeight.w900, color: Colors.black, fontSize: 20.0),
                  ),
                )
              ],
            )
        ),
        elevation: 0,
      ),
      body: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextInput(text: 'Current Password',),
            SizedBox(height: 20.0,),
            TextInput(text: 'New Password (Minimum 6 characters)',),
            SizedBox(height: 20.0,),
            TextInput(text: 'Confirm Password',),
            SizedBox(height: 40.0,),

            FlatButton(
              color: Colors.red,
                onPressed: () {

                },
                child: Text('Save New Password', style: TextStyle(fontSize: 16.0),)
            )
          ],
        )
    ));
  }
}

