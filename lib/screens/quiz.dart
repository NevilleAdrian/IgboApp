import 'package:audioplayers/audio_cache.dart';
import 'package:flushbar/flushbar.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/option_box.dart';
import 'package:nkuzi_igbo/screens/categories_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/screens/home_screen.dart';
import 'package:nkuzi_igbo/screens/result_page.dart';
import 'package:nkuzi_igbo/services/network_helper.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget  {
  QuizScreen({this.lessons, this.courses, this.description, this.category, this.id});
  final List<dynamic> lessons;
  final List<dynamic> courses;
  final String description;
  final String id;
  final String category;


  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with AutomaticKeepAliveClientMixin  {
  double getWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width * 0.5 * width;
  }
  bool correctAnswer;
  bool _loading = false;
  bool correct;
  int number = 0;
  int testNumber =  0;
  int results = 0;
  double figure;
  bool next = false;
  bool _isVisible = true;
  bool _notVisible = false;
  var _feedUrl = 'https://streamingfeed.com';
  var _blankUrl = 'assets/Eli.mp3';

  List result = [];

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache player = AudioCache();

  pausePlayToggle() {
    setState(() {
      _isVisible = !_isVisible;
      print('visible: $_isVisible');
    });
  }

// void showPause() {
//   pausePlayToggle();
//   audioPlayer.pause();
// }
//
// void showPlay() {
//   pausePlayToggle();
//   audioPlayer.play(_blankUrl);
// }

  void playSound(String soundNumber) async {
    audioPlayer = await player.play('$soundNumber.mp3');
    print('sound $soundNumber');
  }

  void pauseSound() {
    audioPlayer?.pause();
  }

  progressBar() {
    figure = (number + 1) / widget.lessons.length;
    return double.parse('${figure.toStringAsFixed(1)}');
  }

  String optionA;
  String optionB;
  String optionC;
  String optionD;

  bool clickedA = false;
  bool clickedB = false;
  bool clickedC = false;
  bool clickedD = false;

  bool dismiss = false;

  String checkAnswerA;
  String checkAnswerB;
  String checkAnswerC;
  String checkAnswerD;

//  bool correctAnswer() {
//   checkAnswerA = clickedA == true ? optionA : null;
//   checkAnswerB = clickedB == true ? optionB : null;
//   checkAnswerC = clickedC == true ? optionC : null;
//   checkAnswerD = clickedD == true ? optionD : null;
//
//    if (checkAnswerA == widget.lessons[number]['test'][testNumber]['correctOption']) {
//      return true;
//    }
//   else if ( checkAnswerB == widget.lessons[number]['test'][testNumber]['correctOption']) {
//      return true;
//    }
//   else if ( checkAnswerC == widget.lessons[number]['test'][testNumber]['correctOption']) {
//      return true;
//    }
//   else if (checkAnswerD == widget.lessons[number]['test'][testNumber]['correctOption']) {
//      return true;
//    }
//    else {
//      return false;
//    }
//  }


  void checkAnswer(String userPickedAnswer) {
    print('userPickedAnswer $userPickedAnswer');
   print("correctOptionss:${widget.lessons[number]['test'][testNumber]['correctOption']}");

    if(userPickedAnswer == widget.lessons[number]['test'][testNumber]['correctOption']){
      correctAnswer = true;
    }
    else {
      correctAnswer = false;
    }
  }

  void checkAnswer2(String userPickedAnswer) {
    print('userPickedAnswer $userPickedAnswer');
    print("correctOptionss:${widget.lessons[number]['test'][testNumber]['correctOption']}");

    if(userPickedAnswer == widget.lessons[number]['test'][testNumber]['correctOption']){
      correct = true;
    }
    else {
      correct = false;
    }
  }


  String text1;
  String text2;
  String text3;
  String text4;

  bool opt1 = false;
  bool opt2 = false;
  bool opt3 = false;
  bool opt4 = false;

  bool show = true;

//  bool correct() {
//    if ( widget.lessons[number]['test'][testNumber]['correctOption'] == text1) {
//      return true;
//    }
//    if ( widget.lessons[number]['test'][testNumber]['correctOption'] == text2) {
//      return true;
//    }
//    if ( widget.lessons[number]['test'][testNumber]['correctOption']== text3) {
//      return true;
//    }
//    if ( widget.lessons[number]['test'][testNumber]['correctOption'] == text4) {
//      return true;
//    }
//    else {
//      return false;
//    }
//  }

  bool isFinished() {
    if (number >= widget.lessons.length - 1 && testNumber >= widget.lessons[number]['test'].length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resultPage() {
    var map = Map();
    result.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });
    var _list = map.values.toList();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultScreen(
                lessons: widget.lessons,
                courses: widget.courses,
                percentage: result,
                score: results,
                description: widget.description
              )),
    );
  }

  double score() {
    return (results / result.length) * 100;
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (builder) {
          return
            widget.lessons[number]['test'].length != 0 ?
            correctAnswer == true
              ? Container(
                  height: 200.0,
                  color: Color(0XFF66C109).withOpacity(0.2),
                  //so you don't have to change MaterialApp canvasColor
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/images/correct.svg",
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'Correct Answer',
                                  style: TextStyle(
                                      color: Color(0XFF66C109),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0),
                                )
                              ],
                            ),
                            isFinished()
                                ? FlatButton(
                                    onPressed: () async{
                                      setState(() {
                                        _loading = true;
                                      });
                                      NetworkHelper _helper = NetworkHelper();
                                      Map<String, dynamic> body = {
                                        "learning_type": widget.description,
                                        "alphabetsFluency": score(),
                                        "totalTest": result.length,
                                        "wordsLearned": results,
                                        "totalPoints": results,
                                        "lesson": widget.id,
                                        "user": Auth.authProvider(context).user.sId,
                                        "category": widget.category
                                      };
                                      var data =  await _helper.calculateResult(body);
                                      print('success: ${data['status']}');
                                      if(data['status'] == 'success'){
                                        setState(() {
                                          _loading = false;
                                        });
                                        resultPage();
                                      }else {
                                        Flushbar(
                                          backgroundColor:
                                          Theme.of(context).accentColor,
                                          message:
                                          "Something went wrong",
                                          duration: Duration(seconds: 3),
                                          flushbarStyle:
                                          FlushbarStyle.GROUNDED,
                                        )..show(context);
                                      }



                                    },
                                    color: Color(0XFF66C109),
                                    child:  _loading
                                        ? CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor: Colors.white,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).primaryColor),
                                    )
                                        : Text('Continue', style: TextStyle(color: Colors.white),),


                                  )
                                :
                            FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        if(widget.lessons[number]['test'] != [] || widget.lessons[number]['test'].length != 0) {
                                          if (testNumber < widget.lessons[number]['test'].length - 1) {
                                            testNumber++;
                                          }
                                          else if((testNumber) >= widget.lessons[number]['test'].length - 1){
                                            number ++;
                                            next = false;
                                            testNumber = 0;
                                          }
                                        }
                                        else {
                                          next = true;
                                        }

                                        print('testNum: $testNumber');
                                        clickedA = false;
                                        clickedB = false;
                                        clickedC = false;
                                        clickedD = false;
                                        Navigator.pop(context);
                                        print('number: $number');
                                        print('progree: ${progressBar()}');
                                        print('figure: $figure');
                                        print(
                                            'length:${widget.lessons.length}');
                                        print('finished: ${isFinished()}');

                                      });
                                    },
                                    color: correctAnswer == true
                                        ? Color(0XFF4C9800)
                                        : Color(0XFF9D1000),
                                    child: Text('Continue'),
                                  ),
                          ],
                        ),
                      )),
                )
              : Container(
                  height: 200.0,
                  color: Color(
                      0XFFFFF5EB), //could change this to Color(0xFF737373),
                  //so you don't have to change MaterialApp canvasColor
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/images/fail.svg",
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text('Wrong Answer',
                                    style: TextStyle(
                                        color: Color(0XFFF21600),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0))
                              ],
                            ),
                            isFinished()
                                ? FlatButton(
                              onPressed: () async{
                                setState(() {
                                  _loading = true;
                                });
                                NetworkHelper _helper = NetworkHelper();
                                Map<String, dynamic> body = {
                                  "learning_type": widget.description,
                                  "alphabetsFluency": score(),
                                  "totalTest": result.length,
                                  "wordsLearned": results,
                                  "totalPoints": results,
                                  "lesson": widget.id,
                                  "user": Auth.authProvider(context).user.sId,
                                  "category": widget.category
                                };
                                var data =  await _helper.calculateResult(body);
                                print('success: ${data['status']}');
                                if(data['status'] == 'success'){
                                  setState(() {
                                    _loading = false;
                                  });
                                  resultPage();
                                }else {
                                  Flushbar(
                                    backgroundColor:
                                    Theme.of(context).accentColor,
                                    message:
                                    "Something went wrong",
                                    duration: Duration(seconds: 3),
                                    flushbarStyle:
                                    FlushbarStyle.GROUNDED,
                                  )..show(context);
                                }



                              },
                                    color: Color(0XFF9D1000),
                              child:  _loading
                                  ? CircularProgressIndicator(
                                strokeWidth: 2,
                                backgroundColor: Colors.white,
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor),
                              )
                                  : Text('Continue', style: TextStyle(color: Colors.white),),
                                  )
                                :
                            FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        if(widget.lessons[number]['test'] != [] || widget.lessons[number]['test'].length != 0) {
                                          if (testNumber < widget.lessons[number]['test'].length - 1) {
                                            testNumber++;
                                          }
                                          else if((testNumber) >= widget.lessons[number]['test'].length - 1){
                                            number ++;
                                            next = false;
                                            testNumber = 0;
                                          }
                                        }
                                        else {
                                          next = true;
                                        }
                                        print('testNum: $testNumber');
                                        clickedA = false;
                                        clickedB = false;
                                        clickedC = false;
                                        clickedD = false;
                                        Navigator.pop(context);
                                        print('number: $number');
                                        print('length:${widget.lessons.length}');
                                        print('progree: ${progressBar()}');
                                        print('figure: $figure');
                                        print('finished: ${isFinished()}');
                                      });
                                    },
                                    color: correctAnswer == true
                                        ? Color(0XFF4C9800)
                                        : Color(0XFF9D1000),
                                    child: Text('Continue'),
                                  ),
                          ],
                        ),
                      )),
                )
          : Container();
        });
  }

  void _bottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (builder) {
          return
            widget.lessons[number]['test'].length != 0 ?
            correct == true
                ? Container(
              height: 200.0,
              color: Color(0XFF66C109).withOpacity(
                  0.2), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/images/correct.svg",
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Correct Answer',
                              style: TextStyle(
                                  color: Color(0XFF66C109),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                            )
                          ],
                        ),
                            isFinished()
                                ? FlatButton(
                              onPressed: () async{
                                setState(() {
                                  _loading = true;
                                });
                                NetworkHelper _helper = NetworkHelper();
                                Map<String, dynamic> body = {
                                  "learning_type": widget.description,
                                  "alphabetsFluency": score(),
                                  "totalTest": result.length,
                                  "wordsLearned": results,
                                  "totalPoints": results,
                                  "lesson": widget.id,
                                  "user": Auth.authProvider(context).user.sId,
                                  "category": widget.category
                                };
                                var data =  await _helper.calculateResult(body);
                                print('success: ${data['status']}');
                                if(data['status'] == 'success'){
                                  setState(() {
                                    _loading = false;
                                  });
                                  resultPage();
                                }else {
                                  Flushbar(
                                    backgroundColor:
                                    Theme.of(context).accentColor,
                                    message:
                                    "Something went wrong",
                                    duration: Duration(seconds: 3),
                                    flushbarStyle:
                                    FlushbarStyle.GROUNDED,
                                  )..show(context);
                                }



                              },
                                    color: Color(0XFF66C109),
                              child:  _loading
                                  ? CircularProgressIndicator(
                                strokeWidth: 2,
                                backgroundColor: Colors.white,
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor),
                              )
                                  : Text('Continue', style: TextStyle(color: Colors.white),),
                                  )
                                :
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if(widget.lessons[number]['test'] != [] || widget.lessons[number]['test'].length != 0) {
                                if (testNumber < widget.lessons[number]['test'].length - 1) {
                                  testNumber++;
                                }
                                else if((testNumber) >= widget.lessons[number]['test'].length - 1){
                                  number ++;
                                  next = false;
                                  testNumber = 0;
                                }
                              }
                              else {
                                next = true;
                              }
                              print('testNum: $testNumber');
                              opt1 = false;
                              opt2 = false;
                              opt3 = false;
                              opt4 = false;
                              print('numberss: $number');
                              print(
                                  'length:${widget.lessons.length}');
                              Navigator.pop(context);
                              print('finished: ${isFinished()}');
                            });
                          },
                          color: correct == true
                              ? Color(0XFF4C9800)
                              : Color(0XFF9D1000),
                          child: Text('Continue'),
                        ),
                      ],
                    ),
                  )),
            )
                : Container(
              height: 200.0,
              color: Color(
                  0XFFFFF5EB), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/images/fail.svg",
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text('Wrong Answer',
                                style: TextStyle(
                                    color: Color(0XFFF21600),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0))
                          ],
                        ),
                            isFinished()
                                ? FlatButton(
                              onPressed: () async{
                                NetworkHelper _helper = NetworkHelper();
                                setState(() {
                                  _loading = true;
                                });
                                Map<String, dynamic> body = {
                                  "learning_type": widget.description,
                                  "alphabetsFluency": score(),
                                  "totalTest": result.length,
                                  "wordsLearned": results,
                                  "totalPoints": results,
                                  "lesson": widget.id,
                                  "user": Auth.authProvider(context).user.sId,
                                  "category": widget.category
                                };
                                var data =  await _helper.calculateResult(body);
                                print('success: ${data['status']}');
                                if(data['status'] == 'success'){
                                  setState(() {
                                    _loading = false;
                                  });
                                  resultPage();
                                }else {
                                  Flushbar(
                                    backgroundColor:
                                    Theme.of(context).accentColor,
                                    message:
                                    "Something went wrong",
                                    duration: Duration(seconds: 3),
                                    flushbarStyle:
                                    FlushbarStyle.GROUNDED,
                                  )..show(context);
                                }



                              },
                                    color: Color(0XFF9D1000),
                              child:  _loading
                                  ? CircularProgressIndicator(
                                strokeWidth: 2,
                                backgroundColor: Colors.white,
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor),
                              )
                                  : Text('Continue', style: TextStyle(color: Colors.white),),
                                  )
                                :
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if(widget.lessons[number]['test'] != []) {
                                if (testNumber < widget.lessons[number]['test'].length -1) {
                                  testNumber++;
                                }
                                else if((testNumber) >= widget.lessons[number]['test'].length - 1){
                                  number ++;
                                  next = false;
                                  testNumber = 0;
                                }
                              }
                              else {
                                next = true;
                              }
                              print('testNum: $testNumber');
                              opt1 = false;
                              opt2 = false;
                              opt3 = false;
                              opt4 = false;
                              print('numberss: $number');
                              print(
                                  'length:${widget.lessons.length}');

                              Navigator.pop(context);
                              print('finished: ${isFinished()}');
                            });
                          },
                          color: correct == true
                              ? Color(0XFF4C9800)
                              : Color(0XFF9D1000),
                          child: Text('Continue'),
                        ),

                      ],
                    ),
                  )),
            )
          : Container()
          ;


        });
  }

  @override
  void initState() {
    print('mylength: ${widget.lessons[number]['test'].length}');
    print('${progressBar()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: next ? EdgeInsets.only(left: 20.0,  top: 20.0, right: 20.0, bottom: 40): EdgeInsets.only(left: 20.0,  top: 20.0, right: 20.0, bottom: 40),
            child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (BuildContext context) => CategoriesScreen(lessons: widget.courses, description: widget.description,)),
                                  ModalRoute.withName('/'));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(
                                        -1, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15.0,
                                child: SvgPicture.asset(
                                  "assets/images/cancel.svg",
                                  height: 20,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            height: 6,
                            width: 100,
                            color: Color(0XFFEDEDED),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                child: Container(
                                    height: 6,
                                    width: getWidth(context, progressBar()),
                                    color: Colors.redAccent),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '${number + 1}/${widget.lessons.length}',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: <Widget>[
                      next ?
                      Column(
                        children: <Widget>[
                          widget.lessons[number]['test'][testNumber]['type'] == 'toIgbo'
                              ? Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    '${widget.lessons[number]['test'][testNumber]['question']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: <Widget>[
                                      _isVisible
                                          ? GestureDetector(
                                        child: SvgPicture.asset(
                                          "assets/images/audio.svg",
                                        ),
                                        onTap: () {
                                          playSound(
                                              widget.lessons[number]
                                              ['voicing']);
                                          pausePlayToggle();
                                        },
                                      )
                                          : GestureDetector(
                                        child: SvgPicture.asset(
                                          "assets/images/pause.svg",
                                        ),
                                        onTap: () {
                                          pauseSound();
                                          pausePlayToggle();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Colors.grey,
                                              height: 0.3)),
                                      Expanded(
                                          flex: 1,
                                          child: Center(
                                              child: Text(
                                                'in English',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15.0),
                                              ))),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Colors.grey,
                                              height: 0.3)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              checkAnswer(widget.lessons[number]['test'][testNumber]['optionA']);
//                                                    optionA = widget.lessons[number]['test'][testNumber]['optionA'];
//                                                    print('optionA: $optionA');
                                              clickedA = !clickedA;
                                              clickedB = false;
                                              clickedC = false;
                                              clickedD = false;
                                            });
                                          },
                                          child: Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  vertical: 30.0,
                                                  horizontal: 25.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: clickedA
                                                      ? Border.all(
                                                      color: Color(
                                                          0XFFF59C01))
                                                      : Border.all(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          5),
                                                      topRight:
                                                      Radius.circular(
                                                          5),
                                                      bottomLeft:
                                                      Radius.circular(
                                                          5),
                                                      bottomRight:
                                                      Radius.circular(5)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                          0.3),
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                      offset: Offset(-1,
                                                          1), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                        height: 50.0,
                                                        child: Image(image: NetworkImage("${widget.lessons[number]['test'][testNumber]['optionAImage']}",))
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                      "${widget.lessons[number]['test'][testNumber]['optionA']}", style: TextStyle(fontSize: 18.0),)
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              checkAnswer(widget.lessons[number]['test'][testNumber]['optionB']);
//                                                    optionB = widget.lessons[number]['test'][testNumber]['optionB'];
//                                                    print('optionB: $optionB');
                                              clickedA = false;
                                              clickedB = !clickedB;
                                              clickedC = false;
                                              clickedD = false;
                                            });
                                          },
                                          child: Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  vertical: 30.0,
                                                  horizontal: 25.0),
                                              decoration: BoxDecoration(
                                                  border: clickedB
                                                      ? Border.all(
                                                      color: Color(
                                                          0XFFF59C01))
                                                      : Border.all(
                                                      color: Colors
                                                          .transparent),
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          5),
                                                      topRight:
                                                      Radius.circular(
                                                          5),
                                                      bottomLeft:
                                                      Radius.circular(
                                                          5),
                                                      bottomRight:
                                                      Radius.circular(5)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                          0.3),
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                      offset: Offset(-1,
                                                          1), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 50.0,
                                                      child: Image(image: NetworkImage("${widget.lessons[number]['test'][testNumber]['optionBImage']}",)),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Text(
                                                        "${widget.lessons[number]['test'][testNumber]['optionB']}", style: TextStyle(fontSize: 18.0))
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              checkAnswer(widget.lessons[number]['test'][testNumber]['optionC']);
//                                                    optionC = widget.lessons[number]['test'][testNumber]['optionC'];
//                                                    print('optionC: $optionC');
                                              clickedA = false;
                                              clickedB = false;
                                              clickedC = !clickedC;
                                              clickedD = false;
                                            });
                                          },
                                          child: Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  vertical: 30.0,
                                                  horizontal: 25.0),
                                              decoration: BoxDecoration(
                                                  border: clickedC
                                                      ? Border.all(
                                                      color: Color(
                                                          0XFFF59C01))
                                                      : Border.all(
                                                      color: Colors
                                                          .transparent),
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          5),
                                                      topRight:
                                                      Radius.circular(
                                                          5),
                                                      bottomLeft:
                                                      Radius.circular(
                                                          5),
                                                      bottomRight:
                                                      Radius.circular(5)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                          0.3),
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                      offset: Offset(-1,
                                                          1), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      height: 50.0,
                                                      child:
                                                      Image(image: NetworkImage("${widget.lessons[number]['test'][testNumber]['optionCImage']}",))
                                                  ),
                                                  SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  Text(
                                                      "${widget.lessons[number]['test'][testNumber]['optionC']}",style: TextStyle(fontSize: 18.0))
                                                ],
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              checkAnswer(widget.lessons[number]['test'][testNumber]['optionD']);
//                                                    optionD = widget.lessons[number]['test'][testNumber]['optionD'];
//                                                    print('optionD: $optionD');
                                              clickedA = false;
                                              clickedB = false;
                                              clickedC = false;
                                              clickedD = !clickedD;
                                            });
                                          },
                                          child: Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  vertical: 30.0,
                                                  horizontal: 25.0),
                                              decoration: BoxDecoration(
                                                  border: clickedD
                                                      ? Border.all(
                                                      color: Color(
                                                          0XFFF59C01))
                                                      : Border.all(
                                                      color: Colors
                                                          .transparent),
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          5),
                                                      topRight:
                                                      Radius.circular(
                                                          5),
                                                      bottomLeft:
                                                      Radius.circular(
                                                          5),
                                                      bottomRight:
                                                      Radius.circular(5)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                          0.3),
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                      offset: Offset(-1,
                                                          1), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      height: 50.0,
                                                      child:
                                                      Image(image: NetworkImage("${widget.lessons[number]['test'][testNumber]['optionDImage']}",))
                                                  ),
                                                  SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  Text(
                                                      "${widget.lessons[number]['test'][testNumber]['optionD']}",style: TextStyle(fontSize: 18.0))
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              FlatButton(
                                  color: Color(0XFFF21600),
                                  onPressed: () {
                                    setState(() {
                                      if(widget.lessons[number]['test'] != [] || widget.lessons[number]['test'].length != 0) {
                                        _modalBottomSheetMenu();
                                      }
                                      result.add(correctAnswer);
                                      correctAnswer ? results++ : 0;
                                      print('result:$results');
                                      print('result:$result');

                                    });
                                    print('CORRECT: ${ widget.lessons[number]['test'][testNumber]['correctOption']}');
                                    print('A $checkAnswerA');
                                    print('B $checkAnswerB');
                                    print('C $checkAnswerC');
                                    print('D $checkAnswerD');

                                    print('answer:$correctAnswer');
                                  },
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )
                              :  Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      '${ widget.lessons[number]['test'][testNumber]['question']}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: <Widget>[
                                        _isVisible
                                            ? GestureDetector(
                                          child: SvgPicture.asset(
                                            "assets/images/audio.svg",
                                          ),
                                          onTap: () {
                                            playSound(widget
                                                .lessons[number]
                                            ['audioUrl']);
                                            pausePlayToggle();
                                          },
                                        )
                                            : GestureDetector(
                                          child: SvgPicture.asset(
                                            "assets/images/pause.svg",
                                          ),
                                          onTap: () {
                                            pauseSound();
                                            pausePlayToggle();
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                color: Colors.grey,
                                                height: 0.3)),
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text(
                                                  'in Igbo',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15.0),
                                                ))),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                color: Colors.grey,
                                                height: 0.3)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        checkAnswer2(widget.lessons[number]['test'][testNumber]['option1']);
                                                        opt1 = !opt1;
                                                        opt2 = false;
                                                        opt3 = false;
                                                        opt4 = false;
                                                        print('text1:$text1');
                                                      });
                                                    },
                                                    child: OptionBox(
                                                      option:
                                                      widget.lessons[number]['test'][testNumber]['option1'],
                                                      gradient1: opt1
                                                          ? Color(
                                                          0XFFF7B500)
                                                          : Colors.white,
                                                      gradient2: opt1
                                                          ? Color(
                                                          0XFFF48C02)
                                                          : Colors.white,
                                                    ))),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        checkAnswer2(widget.lessons[number]['test'][testNumber]['option2']);
                                                        opt2 = !opt2;
                                                        opt1 = false;
                                                        opt3 = false;
                                                        opt4 = false;
                                                        print(
                                                            'text2:$text2');
                                                      });
                                                    },
                                                    child: OptionBox(
                                                      option: widget.lessons[number]['test'][testNumber]['option2'],
                                                      gradient1: opt2
                                                          ? Color(
                                                          0XFFF7B500)
                                                          : Colors.white,
                                                      gradient2: opt2
                                                          ? Color(
                                                          0XFFF48C02)
                                                          : Colors.white,
                                                    ))),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        checkAnswer2(widget.lessons[number]['test'][testNumber]['option3']);
                                                        opt3 = !opt3;
                                                        opt2 = false;
                                                        opt1 = false;
                                                        opt4 = false;
                                                        print(
                                                            'text1:$text3');
                                                      });
                                                    },
                                                    child: OptionBox(
                                                      option:
                                                      widget.lessons[number]['test'][testNumber]['option3'],
                                                      gradient1: opt3
                                                          ? Color(
                                                          0XFFF7B500)
                                                          : Colors.white,
                                                      gradient2: opt3
                                                          ? Color(
                                                          0XFFF48C02)
                                                          : Colors.white,
                                                    ))),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        checkAnswer2(widget.lessons[number]['test'][testNumber]['option4']);
                                                        opt4 = !opt4;
                                                        opt2 = false;
                                                        opt3 = false;
                                                        opt1 = false;
                                                        print(
                                                            'text4:$text4');
                                                      });
                                                    },
                                                    child: OptionBox(
                                                      option:
                                                      widget.lessons[number]['test'][testNumber]['option4'],
                                                      gradient1: opt4
                                                          ? Color(
                                                          0XFFF7B500)
                                                          : Colors.white,
                                                      gradient2: opt4
                                                          ? Color(
                                                          0XFFF48C02)
                                                          : Colors.white,
                                                    ))),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 80.0,
                                    ),
                                    FlatButton(
                                        color: Color(0XFFF21600),
                                        onPressed: () {
                                          setState(() {
                                            if(widget.lessons[number]['test'] != [] || widget.lessons[number]['test'].length != 0){
                                              _bottomSheetMenu();
                                            }
                                            result.add(correct);
                                            correct == true ? results++ : 0;
                                            print('results:$results');
                                            print('result:$result');

                                            print('CORRECT:${ widget.lessons[number]['test'][testNumber]['correctOption']}');
                                            print('A $checkAnswerA');
                                            print('B $checkAnswerB');
                                            print('C $checkAnswerC');
                                            print('D $checkAnswerD');
                                          });
                                          print('answer:$correct');
                                        },
                                        child: Text(
                                          'Continue',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ) :
                      Column(
                        children: <Widget>[
                          Text(
                            '${widget.lessons[number]['description']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0,
                                  horizontal: 25.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight:
                                      Radius.circular(5),
                                      bottomLeft:
                                      Radius.circular(5),
                                      bottomRight:
                                      Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(-1,
                                          1), // changes position of shadow
                                    ),
                                  ]),
                              child: Image(
                                image: NetworkImage("${widget.lessons[number]['picture']}"),
                              )

                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              number == 0
                                  ? GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/images/left-grey.svg",
                                ),
                              )
                                  : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    number--;
                                  });
                                },
                                child: SvgPicture.asset(
                                  "assets/images/left.svg",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if(widget.lessons[number]['test'] == [] || widget.lessons[number]['test'].length == 0 ){
                                      next = false;
                                      number ++;
                                    }
                                    else {
                                      next = true;
                                    }
                                  });
                                },
                                child: SvgPicture.asset(
                                  "assets/images/right.svg",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )

                ]
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
