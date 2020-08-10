import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/Settings.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _subController = TextEditingController();

bool name = true;
bool location = true;

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _subController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    name = true;
    location = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          title:  Text( 'Profile', style: TextStyle( fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600,  fontFamily: 'Poppins'),),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Settings(
                        )
                    ),
                  );
                },
                child: SvgPicture.asset("assets/images/settings.svg",
                    color: Colors.black
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(child: CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
                      ),),
                      SizedBox(height: 20.0,),
                      Text('Chisom Okoro', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0 ),)
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0XFFB5B5B5), width: 0.4),
                      color: Colors.white,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            name ?
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  name = !name;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide( color: Colors.grey, width: 0.4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Chisomokoro@gmail.com', style: TextStyle(color: Colors.black, fontSize: 16 ),),
                                      Text('edit', style: TextStyle(color: Color(0XFFF21600)),)
                                    ],
                                  ),
                                ),

                              ),
                            ):
                            TextFormField(
                              controller: _nameController,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                focusedBorder: InputBorder.none,
                                labelText: "Chisomokoro@gmail.com",
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white, filled: true,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (String value) {
                                if (value.length < 1) {
                                  return 'Please enter the right name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            location ?
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  location = !location;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide( color: Colors.grey, width: 0.4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Lagos Nigeria', style: TextStyle(color: Colors.black, fontSize: 16 ),),
                                      Text('edit', style: TextStyle(color: Color(0XFFF21600)),)
                                    ],
                                  ),
                                ),

                              ),
                            ):
                            TextFormField(
                              controller: _locationController,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                focusedBorder: InputBorder.none,
                                labelText: 'Lagos Nigeria',
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white, filled: true,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (String value) {
                                if (value.length < 1) {
                                  return 'Please enter the right location';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Subsciption', style: TextStyle(color: Colors.black, fontSize: 16 ),),
                                SizedBox(
                                  height: 27,
                                  width: 70,
                                  child: FlatButton(
                                      color: Color(0XFFF21600),
                                      onPressed: () {

                                      },
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: Text('Active', style: TextStyle(fontSize: 13),)
                                  ),
                                )
                              ],
                            ),
                          ),

                        )
                      ],
                    ) ,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  SvgPicture.asset("assets/images/banner.svg"),
                 SizedBox(
                   height: 30.0,
                 ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0XFFB5B5B5), width: 0.4),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide( color: Colors.grey, width: 0.4 ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                                    child: Text('Days Learnt', textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                                  )
                              ),

                              SizedBox(height: 20.0,),
                              Container(
                                height: 80,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                              Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: new BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment.topRight,
                                                        end: Alignment.bottomLeft,
                                                        colors: [Color(0XFFF7B500), Color(0XFFF48C02)]),
                                                    shape: BoxShape.circle,
                                                )
                                              ),
                                                SizedBox(height: 10,),
                                                Text('Mon', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: new BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomLeft,
                                                          colors: [Colors.white, Colors.white]),
                                                      shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey, width: 0.4)
                                                    )
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Tue', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: new BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomLeft,
                                                          colors: [Color(0XFFF7B500), Color(0XFFF48C02)]),
                                                      shape: BoxShape.circle,
                                                    )
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Wed', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: new BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment.topRight,
                                                            end: Alignment.bottomLeft,
                                                            colors: [Colors.white, Colors.white]),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey, width: 0.4)
                                                    )
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Thu', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: new BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomLeft,
                                                          colors: [Color(0XFFF7B500), Color(0XFFF48C02)]),
                                                      shape: BoxShape.circle,
                                                    )
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Fri', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: new BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment.topRight,
                                                            end: Alignment.bottomLeft,
                                                            colors: [Colors.white, Colors.white]),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey, width: 0.4)
                                                    )
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Sat', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: new BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomLeft,
                                                          colors: [Color(0XFFF7B500), Color(0XFFF48C02)]),
                                                      shape: BoxShape.circle,
                                                    )
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Sun', style: TextStyle(fontSize: 12.0),)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
