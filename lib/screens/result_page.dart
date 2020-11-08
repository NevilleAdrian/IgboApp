import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/models/study.dart';
import 'package:nkuzi_igbo/models/sub_category.dart';
import 'package:nkuzi_igbo/models/user_result_model.dart';
import 'package:nkuzi_igbo/screens/categories_screen.dart';
import 'package:nkuzi_igbo/services/network_helper.dart';
import 'package:nkuzi_igbo/ui_widgets/future_helper.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'home_page.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {this.lessons,
      this.percentage,
      this.score,
      this.courses,
      this.description,
      this.id,
      this.title,
      this.thumbnail,
      this.data});

  final List<Study> lessons;
  final List<SubCategory> courses;
  final UserResultModel data;
  final List percentage;
  final int score;
  final String description;
  final String id;
  final String title;
  final String thumbnail;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<dynamic> postUserResult() async {
    if (widget.data != null) {
      NetworkHelper _helper = NetworkHelper();
      try {
        return await _helper.calculateResult(widget.data.toJson());
      } catch (ex) {
        print(ex);
      }
    }
    return null;
  }

  Future<bool> futureResult;
  Future<bool> futureTask() async {
    await postUserResult();
    return Future.value(true);
  }

  String pass() {
    if ((widget.data?.alphabetsFluency ?? 0) < 50.0) {
      return 'Not Fluent in ${widget.title ?? 'this lesson'}';
    } else {
      return 'Fluent in ${widget.title ?? 'this lesson'}';
    }
  }

  @override
  void initState() {
    futureResult = futureTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CategoriesScreen(
              lessons: widget.courses,
              description: widget.description,
              id: widget.id,
              title: widget.title,
              thumbnail: widget.thumbnail,
            ),
          ),
          ModalRoute.withName(HomePage.id),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: FutureHelper<bool>(
          task: futureResult,
          builder: (context, _) => Container(
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
                      CircularPercentIndicator(
                        radius: 170.0,
                        lineWidth: 14.0,
                        animation: true,
                        percent: (widget?.data?.alphabetsFluency ?? 0) / 100,
                        center: new Text(
                          '${widget.data?.alphabetsFluency?.toStringAsFixed(0) ?? 0}%',
                          style: new TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30.0,
                              color: Colors.white),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        linearGradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0XFFF7B500), Color(0XFFF48C02)]),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('${pass()}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    widget.data?.wordsLearned?.toString() ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 40,
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Words learned',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    widget.data?.wordsLearned?.toString() ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 40,
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Total Points',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      FlatButton(
                          color: Color(0XFFF21600),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoriesScreen(
                                  lessons: widget.courses,
                                  description: widget.description,
                                  id: widget.id,
                                  title: widget.title,
                                  thumbnail: widget.thumbnail,
                                ),
                              ),
                              ModalRoute.withName(HomePage.id),
                            );
                          },
                          child: Text('Continue'))
                    ],
                  )),
                ],
              ))),
        ),
      ),
    );
  }
}
