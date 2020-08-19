import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({this.lessons, this.percentage, this.score});

  final List<dynamic> lessons;
  final List percentage;
  final int score;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  double percent() {
    double p = (widget.score/widget.percentage.length) * 100;
    return p;
  }
  double score() {
  return  widget.score/widget.percentage.length;
  }

  String pass() {
    if(percent() < 50.0) {
      return 'Not Fluent in Alphabets';
    }
    else {
      return 'Fluent in Alphabets';
    }
  }

  @override
  void initState() {
    print('newlesson: ${widget.score}');
    print('percent:${widget.percentage.length}');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
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
                              Text('Well done!', style: TextStyle(color: Colors.white, fontSize: 27.0, fontWeight: FontWeight.w500),),
                              SizedBox(height: 20.0,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          CircularPercentIndicator(
                            radius: 170.0,
                            lineWidth: 14.0,
                            animation: true,
                            percent: score(),
                            center: new Text( '${percent().toStringAsFixed(0)}%',
                              style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0, color: Colors.white),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            linearGradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [ Color(0XFFF7B500),  Color(0XFFF48C02)]),
                          ),
                          SizedBox(height: 30,),
                          Text('${pass()}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18, )),
                          SizedBox(height: 30,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('${widget.score}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 40, )),
                                    Text('Words learned', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18, ))
                                  ],
                                ),
                                SizedBox(width: 30.0,),
                                Container(color: Colors.white , height: 70.0, width: 2,),
                                SizedBox(width: 30.0,),

                                Column(
                                  children: <Widget>[
                                    Text('${widget.score}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 40, )),
                                    Text('Total Points', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18, ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 60.0,),
                          FlatButton(
                            color: Color(0XFFF21600) ,
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                                    ModalRoute.withName('/'));
                              },
                              child: Text('Continue')
                          )

                        ],
                      )
                  ),
                ],
              )
          )
      ),
    );
  }
}
