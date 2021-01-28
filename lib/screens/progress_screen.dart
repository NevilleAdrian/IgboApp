import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/models/progres_model.dart';
import 'package:nkuzi_igbo/models/user_model.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/settings.dart';
import 'package:nkuzi_igbo/services/network_helper.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  String textValue = 'Numbers';
  User user = User();
  NetworkHelper _helper = NetworkHelper();
  dynamic progress;
  dynamic catList;
  String catNumber;
  String cath;
  int number;

  Progress pro = Progress();

  dynamic myCatList() async {
    var p = await _helper.getCategoryList();
    setState(() {
      catList = p;
    });
    return p;
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < catList.length; i++) {
      cath = catList[i]['name'];

      var newItem = DropdownMenuItem(
          child: Text(cath),
          value: cath,
          onTap: () {
            setState(() {
              number = catList.indexOf(catList[i]);
            });
          });
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        hint: Text(
          "Select a topic",
          style: TextStyle(color: Colors.black),
        ),
        dropdownColor: Colors.white,
        value: textValue,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            print('value : $value');
            print('num: $number');
            textValue = value;
            print('text : $textValue');
          });
        });
  }

  dynamic myProgress(number) async {
    var category = Provider.of<Auth>(context, listen: false).category;
    var p = await _helper.getProgress(Auth.authProvider(context).user.sId,
        category[number == null ? 0 : number].sId);
    setState(() {
      progress = p;
    });
    return p;
  }

  @override
  void initState() {
    myCatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myProgress(number);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Progress',
            style: kAuthTextBig.copyWith(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 25.0),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: SvgPicture.asset("assets/images/settings.svg",
                    color: Colors.black),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            progress != null && catList != null
                ? Container(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                height: 65,
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.4),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: androidDropdown()),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 23.0, right: 0.0),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SliderContainer(
                                progress: progress,
                                color: 0XFFF21600,
                                text: 'basic',
                                form: 'Beginner',
                                color1: 0XFFF21600,
                                color2: 0XFFF21600,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              SliderContainer(
                                progress: progress,
                                color: 0XFFF21600,
                                text: 'intermediate',
                                form: 'Intermediate',
                                color1: 0XFFF7B500,
                                color2: 0XFFF48C02,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              SliderContainer(
                                progress: progress,
                                color: 0XFF9D1000,
                                text: 'advanced',
                                form: 'Advanced',
                                color1: 0XFF9D1000,
                                color2: 0XFF9D1000,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Center(
                            child: Text(
                          'Fluent in $textValue',
                          style:
                              TextStyle(color: Color(0XFF9D1000), fontSize: 17),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircularPercentIndicator(
                          radius: 170.0,
                          lineWidth: 16.0,
                          animation: true,
                          percent: progress['data']['alphabetsFluency'] == 0
                              ? double.parse(
                                  '${progress['data']['alphabetsFluency']}.0')
                              : (progress['data']['alphabetsFluency']) / 100,
                          center: new Text(
                            '${double.parse(progress['data']['alphabetsFluency'].toString()).toStringAsFixed(0)}%',
                            style: new TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                                color: Colors.black),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          linearGradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0XFFF7B500), Color(0XFFF48C02)]),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Total\nLessons'),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      progress['data']['lessonsAttempted']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '/${progress['data']['totalLessons'].toString()}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              children: <Widget>[
                                Text('Total\nPoints'),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      progress['data']['totalPoints']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // Text(
                                    //   '/${progress['data']['totalTest'].toString()}',
                                    //   style: TextStyle(fontSize: 15),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              children: <Widget>[
                                Text('Test\nAttempted'),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      progress['data']['totalTest'].toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // Text(
                                    //   '/${progress['data']['totalTest'].toString()}',
                                    //   style: TextStyle(fontSize: 15),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    )),
                  )
          ],
        ),
      ),
    );
  }
}

class SliderContainer extends StatelessWidget {
  const SliderContainer(
      {@required this.progress,
      this.color,
      this.text,
      this.form,
      this.color1,
      this.color2});

  final dynamic progress;
  final int color;
  final int color1;
  final int color2;
  final String text;
  final String form;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.2,
        padding: EdgeInsets.only(top: 20, bottom: 5),
        decoration: BoxDecoration(
            color: Color(color),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(color1),
                  Color(color2),
                ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(-1, 1), // changes position of shadow
              ),
            ]),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  form,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              Divider(color: Color(0XFFD8D8D8), thickness: 1),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  'Words\nlearned',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                //child:
                // Text(
                //   progress['data'][text].toString(),
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 35,
                //       fontWeight: FontWeight.w600),
                // ),
              )
            ],
          ),
        ));
  }
}
