import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/categories_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ThankYou extends StatefulWidget {
  ThankYou(
      {this.lessons, this.courses, this.description, this.id, this.thumbnail});

  final List<dynamic> lessons;
  final List<dynamic> courses;
  final String description;
  final String id;
  final String thumbnail;
  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(Color(0XFF330000), BlendMode.dstATop),
              image: AssetImage("assets/images/Afterr-quiz.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Well done!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Click continue to learn again or start a new lesson',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                      color: Color(0XFFF21600),
                      onPressed: () {
                        var data = Auth.authProvider(context)
                            .category
                            .firstWhere((element) {
                          print('element is $element');
                          print('widget id is ${widget.id}');
                          return element.sId == widget.id;
                        });
                        print(data);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoriesScreen(
                                      lessons: data.subCategories,
                                      description: widget.description,
                                      id: widget.id,
                                      thumbnail: widget.thumbnail,
                                    )),
                            ModalRoute.withName('/'));
                      },
                      child: Text('Continue'))
                ],
              )),
            ],
          ))),
    );
  }
}
