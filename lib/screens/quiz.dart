import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nkuzi_igbo/screens/OptionBox.dart';
import 'package:nkuzi_igbo/screens/categories_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/screens/home_screen.dart';
import 'package:nkuzi_igbo/screens/result_page.dart';


class QuizScreen extends StatefulWidget {
  QuizScreen({ this.lessons });
  final List<Map<String, Object>> lessons;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

 double getWidth(BuildContext context, double width) {
     return MediaQuery.of(context).size.width * 0.5 * width;
 }

 int number = 0;
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

  void playSound(String soundNumber) async{
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
 
 bool correctAnswer() {
  String checkAnswerA =  clickedA == true ? optionA : null;
  String checkAnswerB =  clickedB == true ? optionB : null;
  String checkAnswerC =  clickedC == true ? optionC : null;
  String checkAnswerD =  clickedD == true ? optionD : null;

  if(widget.lessons[number]['correctOption'] == checkAnswerA ) {
     return true;
   }
  else if(widget.lessons[number]['correctOption'] == checkAnswerB ) {
    return true;
  }
  else if(widget.lessons[number]['correctOption'] == checkAnswerC ) {
    return true;
  }
  else if(widget.lessons[number]['correctOption'] == checkAnswerD ) {
    return true;
  }
  else {
    return false;
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





bool correct() {
  if(widget.lessons[number]['correctOption'] == text1){
    return true;
  }
  else if(widget.lessons[number]['correctOption'] == text2){
    return true;
  }
  else if(widget.lessons[number]['correctOption'] == text3){
    return true;
  }
  else if(widget.lessons[number]['correctOption'] == text4){
    return true;
  }
  else {
    return false;
  }

}


bool isFinished() {
  if(number >= widget.lessons.length - 1) {
   return true;
  }
  else{
    return false;
  }
}

void resultPage() {
  var map = Map();
  result.forEach((element) {
    if(!map.containsKey(element)) {
      map[element] = 1;
    } else {
      map[element] +=1;
    }
  });
  var _list = map.values.toList();

  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ResultScreen(
            lessons: widget.lessons,
            percentage: _list,
        )
    ),
  );
}



  void _modalBottomSheetMenu(){
   showModalBottomSheet(
       context: context,
       isDismissible: false,
       builder: (builder){
         return correctAnswer() == true ? Container(
           height: 200.0,
           color: Color(0XFF66C109).withOpacity(0.2), //could change this to Color(0xFF737373),
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
                         SizedBox(width: 20.0,),
                         Text('Correct Answer', style: TextStyle(color: Color(0XFF66C109),fontWeight: FontWeight.w600, fontSize: 20.0),)
                       ],
                     ),
                     isFinished()  ? FlatButton(
                       onPressed: () {
                         resultPage();
                       },
                       color: Color(0XFF9D1000),
                       child: Text('Continue'),
                     ) :   FlatButton(
                       onPressed: () {
                        setState(() {
                          number ++;
                          next = false;
                          clickedA = false;
                          clickedB = false;
                          clickedC = false;
                          clickedD = false;
                          Navigator.pop(context);
                          print('number: $number');
                          print('progree: ${progressBar()}');
                          print('figure: $figure');
                          print('length:${widget.lessons.length}');
                          print('finished: ${isFinished()}');
                        });

                       },
                       color: correctAnswer() == true ? Color(0XFF4C9800) : Color(0XFF9D1000),
                       child: Text('Continue'),
                     ),
                   ],
                 ),
               )
                 ),
         ):
         Container(
           height: 200.0,
           color: Color(0XFFFFF5EB), //could change this to Color(0xFF737373),
           //so you don't have to change MaterialApp canvasColor
           child: new Container(
               decoration: new BoxDecoration(
                   color: Colors.white,
                   borderRadius: new BorderRadius.only(
                       topLeft: const Radius.circular(10.0),
                       topRight: const Radius.circular(10.0))),
               child:  Padding(
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
                         SizedBox(width: 20.0,),
                         Text('Wrong Answer',  style: TextStyle(color: Color(0XFFF21600),fontWeight: FontWeight.w600, fontSize: 20.0))
                       ],
                     ),
                     isFinished()  ? FlatButton(
                       onPressed: () {
                         resultPage();
                       },
                       color: Color(0XFF9D1000),
                       child: Text('Continue'),
                     ) :
                     FlatButton(
                       onPressed: () {
                         setState(() {
                           number ++;
                           next = false;
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
                       color: correctAnswer() == true ? Color(0XFF4C9800) : Color(0XFF9D1000),

                       child: Text('Continue'),
                     ),
                   ],
                 ),
               )
           ),
         ) ;
       }
   );
 }
  void _bottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (builder){
          return correct() == true ? Container(
            height: 200.0,
            color: Color(0XFF66C109).withOpacity(0.2), //could change this to Color(0xFF737373),
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
                          SizedBox(width: 20.0,),
                          Text('Correct Answer', style: TextStyle(color: Color(0XFF66C109),fontWeight: FontWeight.w600, fontSize: 20.0),)
                        ],
                      ),
                      isFinished()  ? FlatButton(
                        onPressed: () {
                          resultPage();
                        },
                        color: Color(0XFF9D1000),
                        child: Text('Continue'),
                      ) : FlatButton(
                        onPressed: () {
                          setState(() {
                            number ++;
                            next = false;
                             opt1 = false;
                             opt2 = false;
                             opt3 = false;
                             opt4 = false;
                            print('numberss: $number');
                            print('length:${widget.lessons.length}');
                            Navigator.pop(context);
                            print('finished: ${isFinished()}');
                          });
                        },
                        color: correct() == true ? Color(0XFF4C9800) : Color(0XFF9D1000),

                        child: Text('Continue'),
                      ),
                    ],
                  ),
                )
            ),
          ):
          Container(
            height: 200.0,
            color: Color(0XFFFFF5EB), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child:  Padding(
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
                          SizedBox(width: 20.0,),
                          Text('Wrong Answer',  style: TextStyle(color: Color(0XFFF21600),fontWeight: FontWeight.w600, fontSize: 20.0))
                        ],
                      ),
                      isFinished()  ? FlatButton(
                        onPressed: () {
                          resultPage();
                        },
                        color: Color(0XFF9D1000),
                        child: Text('Continue'),
                      ) :  FlatButton(
                        onPressed: () {
                          setState(() {
                            number ++;
                            next = false;
                            opt1 = false;
                            opt2 = false;
                            opt3 = false;
                            opt4 = false;
                            print('numberss: $number');
                            print('length:${widget.lessons.length}');

                            Navigator.pop(context);
                            print('finished: ${isFinished()}');
                          });

                        },
                        color: correct() == true ? Color(0XFF4C9800) : Color(0XFF9D1000),
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                )
            ),
          ) ;
        }
    );
  }





  @override
  void initState() {
    print('lessonsss: ${widget.lessons[number]}');
    print('${progressBar()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Expanded(
                       flex: 1,
                       child: GestureDetector(
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => HomePage()
                             ),
                           );
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
                                 offset: Offset(-1, 1), // changes position of shadow
                               ),
                             ],
                           ),
                           child: CircleAvatar(
                             backgroundColor: Colors.white,
                             radius: 15.0,
                             child:  SvgPicture.asset(
                               "assets/images/cancel.svg", height: 20,),
                           ),
                         ),
                       )
                   ),
                   SizedBox(width: 15.0,),

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
                                 color: Colors.redAccent
                             ),
                           ),
                         )
                     ),
                   ),
                   SizedBox(width: 25.0,),
                   Expanded(
                       flex: 1,
                       child: Text('${number + 1}/${widget.lessons.length}', style: TextStyle(color: Colors.redAccent, fontSize: 15, fontWeight: FontWeight.w600),)
                   )
                 ],
               ),
               SizedBox(height: 30.0,),
               next ? Column(
                 children: <Widget>[
                   widget.lessons[number]['type'] == 'toIgbo' ?
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                       Column(
                         children: <Widget>[
                           Text('${widget.lessons[number]['answerQuestion']}', textAlign: TextAlign.center, style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.w600), ),
                           SizedBox(height: 20.0,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: <Widget>[
                               _isVisible ? GestureDetector(
                                 child: SvgPicture.asset(
                                   "assets/images/audio.svg",
                                 ),
                                 onTap: () {
                                 playSound(widget.lessons[number]['audioUrl']);
                                 pausePlayToggle();
                                 },
                               ) : GestureDetector(
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
                           SizedBox(height: 20.0,),
                           Row(
                             children: <Widget>[
                               Expanded( flex: 1,child: Container(color: Colors.grey , height: 0.3)),
                               Expanded(flex: 1 ,child: Center(child: Text('in English', style: TextStyle(color: Colors.grey, fontSize: 15.0),))) ,
                               Expanded(flex: 1, child: Container(color: Colors.grey , height: 0.3)),
                             ],
                           ),
                           SizedBox(height: 20.0,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Expanded(
                                 child: GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       optionA = widget.lessons[number]['optionA'];
                                       print('optionA: $optionA');
                                       clickedA = !clickedA;
                                       clickedB = false;
                                       clickedC = false;
                                       clickedD = false;
                                     });
                                   },
                                   child: Container(
                                       padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           border: clickedA ? Border.all(color: Color(0XFFF59C01)): Border.all(color: Colors.transparent),
                                           borderRadius:  BorderRadius.only(
                                               topLeft: Radius.circular(5),
                                               topRight: Radius.circular(5),
                                               bottomLeft: Radius.circular(5),
                                               bottomRight: Radius.circular(5)
                                           ),
                                           boxShadow: [
                                             BoxShadow(
                                               color: Colors.grey.withOpacity(0.3),
                                               spreadRadius: 1,
                                               blurRadius: 10,
                                               offset: Offset(-1, 1), // changes position of shadow
                                             ),
                                           ]
                                       ),
                                       child: Container(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                                             Container(
                                               height: 50.0,
                                               child: SvgPicture.asset(
                                                 "${widget.lessons[number]['optionAImage']}",),
                                             ),
                                             SizedBox(
                                               height: 15.0,
                                             ),
                                             Text("${widget.lessons[number]['optionA']}")
                                           ],
                                         ),
                                       )
                                   ),
                                 ),
                               ),
                               SizedBox(width: 30.0,),
                               Expanded(
                                 child: GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       optionB = widget.lessons[number]['optionB'];
                                       print('optionB: $optionB');
                                       clickedA = false;
                                       clickedB = !clickedB;
                                       clickedC = false;
                                       clickedD = false;
                                     });
                                   },
                                   child: Container(
                                       padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                                       decoration: BoxDecoration(
                                           border: clickedB ? Border.all(color: Color(0XFFF59C01)): Border.all(color: Colors.transparent),
                                           color: Colors.white,
                                           borderRadius:  BorderRadius.only(
                                               topLeft: Radius.circular(5),
                                               topRight: Radius.circular(5),
                                               bottomLeft: Radius.circular(5),
                                               bottomRight: Radius.circular(5)
                                           ),
                                           boxShadow: [
                                             BoxShadow(
                                               color: Colors.grey.withOpacity(0.3),
                                               spreadRadius: 1,
                                               blurRadius: 10,
                                               offset: Offset(-1, 1), // changes position of shadow
                                             ),
                                           ]
                                       ),
                                       child: Container(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                                             Container(
                                               height: 50.0,
                                               child: SvgPicture.asset(
                                                 "${widget.lessons[number]['optionBImage']}",),
                                             ),
                                             SizedBox(
                                               height: 15.0,
                                             ),
                                             Text("${widget.lessons[number]['optionB']}")
                                           ],
                                         ),
                                       )
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: 40.0,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Expanded(
                                 child: GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       optionC = widget.lessons[number]['optionC'];
                                       print('optionC: $optionC');
                                       clickedA = false;
                                       clickedB = false;
                                       clickedC = !clickedC;
                                       clickedD = false;
                                     });
                                   },
                                   child: Container(
                                       padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                                       decoration: BoxDecoration(
                                           border: clickedC ? Border.all(color: Color(0XFFF59C01)): Border.all(color: Colors.transparent),
                                           color: Colors.white,
                                           borderRadius:  BorderRadius.only(
                                               topLeft: Radius.circular(5),
                                               topRight: Radius.circular(5),
                                               bottomLeft: Radius.circular(5),
                                               bottomRight: Radius.circular(5)
                                           ),
                                           boxShadow: [
                                             BoxShadow(
                                               color: Colors.grey.withOpacity(0.3),
                                               spreadRadius: 1,
                                               blurRadius: 10,
                                               offset: Offset(-1, 1), // changes position of shadow
                                             ),
                                           ]
                                       ),
                                       child: Column(
                                         children: <Widget>[
                                           Container(
                                             height: 50.0,
                                             child: SvgPicture.asset(
                                               "${widget.lessons[number]['optionCImage']}",),
                                           ),
                                           SizedBox(
                                             height: 15.0,
                                           ),
                                           Text("${widget.lessons[number]['optionC']}")
                                         ],
                                       )
                                   ),
                                 ),
                               ),
                               SizedBox(width: 30.0,),
                               Expanded(
                                 child: GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       optionD = widget.lessons[number]['optionD'];
                                       print('optionD: $optionD');
                                       clickedA = false;
                                       clickedB = false;
                                       clickedC = false;
                                       clickedD = !clickedD;
                                     });
                                   },
                                   child: Container(
                                       padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                                       decoration: BoxDecoration(
                                           border: clickedD ? Border.all(color: Color(0XFFF59C01)): Border.all(color: Colors.transparent),
                                           color: Colors.white,
                                           borderRadius:  BorderRadius.only(
                                               topLeft: Radius.circular(5),
                                               topRight: Radius.circular(5),
                                               bottomLeft: Radius.circular(5),
                                               bottomRight: Radius.circular(5)
                                           ),
                                           boxShadow: [
                                             BoxShadow(
                                               color: Colors.grey.withOpacity(0.3),
                                               spreadRadius: 1,
                                               blurRadius: 10,
                                               offset: Offset(-1, 1), // changes position of shadow
                                             ),
                                           ]
                                       ),
                                       child: Column(
                                         children: <Widget>[
                                           Container(
                                             height: 50.0,
                                             child: SvgPicture.asset(
                                               "${widget.lessons[number]['optionDImage']}",),
                                           ),
                                           SizedBox(
                                             height: 15.0,
                                           ),
                                           Text("${widget.lessons[number]['optionD']}")
                                         ],
                                       )
                                   ),
                                 ),
                               ),
                             ],
                           )
                         ],
                       ),
                       SizedBox(height: 60.0,),
                       FlatButton(
                           color: Color(0XFFF21600),
                           onPressed: () {
                             setState(() {
                               _modalBottomSheetMenu();
                               result.add(correctAnswer());
                               print('result:$result');
                             });
                             print('answer:${correctAnswer()}');
                           }, child: Text('Continue', style: TextStyle( color: Colors.white),)
                       )

                     ],
                   ): SizedBox(height: 0,)
                 ],
               )
                   : Column(
                 children: <Widget>[
                   widget.lessons[number]['type'] == 'toIgbo' ?
                   Column(
                     children: <Widget>[
                       Column(
                         children: <Widget>[
                           Text('${widget.lessons[number]['mainquestion']}', textAlign: TextAlign.center, style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.w600), ),
                           SizedBox(height: 55.0,),
                           Container(
                               padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius:  BorderRadius.only(
                                       topLeft: Radius.circular(5),
                                       topRight: Radius.circular(5),
                                       bottomLeft: Radius.circular(5),
                                       bottomRight: Radius.circular(5)
                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.3),
                                       spreadRadius: 1,
                                       blurRadius: 10,
                                       offset: Offset(-1, 1), // changes position of shadow
                                     ),
                                   ]
                               ),
                               child: SvgPicture.asset(
                                 "${widget.lessons[number]['questionImage']}",)
                           ),
                         ],
                       ),
                       SizedBox(height: 100.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           number == 0 ? GestureDetector(
                             onTap: () {

                             },
                             child: SvgPicture.asset(
                               "assets/images/left-grey.svg",
                             ),
                           ) :
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 number --;
                               });
                             },
                             child: SvgPicture.asset(
                               "assets/images/left.svg",
                             ),
                           ),
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 next = true;
                               });
                             },
                             child: SvgPicture.asset(
                               "assets/images/right.svg",
                             ),
                           )
                         ],
                       )
                     ],
                   ):
                   Column(
                     children: <Widget>[
                       Container(
                         padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.stretch,
                           children: <Widget>[
                             Text('${widget.lessons[number]['mainquestion']}', textAlign: TextAlign.center, style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.w600), ),
                             SizedBox(height: 20.0,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: <Widget>[
                                 _isVisible ? GestureDetector(
                                   child: SvgPicture.asset(
                                     "assets/images/audio.svg",
                                   ),
                                   onTap: () {
                                     playSound(widget.lessons[number]['audioUrl']);
                                     pausePlayToggle();
                                   },
                                 ) : GestureDetector(
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
                             SizedBox(height: 20.0,),
                             Row(
                               children: <Widget>[
                                 Expanded( flex: 1,child: Container(color: Colors.grey , height: 0.3)),
                                 Expanded(flex: 1 ,child: Center(child: Text('in Igbo', style: TextStyle(color: Colors.grey, fontSize: 15.0),))) ,
                                 Expanded(flex: 1, child: Container(color: Colors.grey , height: 0.3)),
                               ],
                             ),
                             SizedBox(height: 40.0,),
                             Column(
                               children: <Widget>[
                                 Row(
                                   children: <Widget>[
                                     Expanded(child: GestureDetector(
                                         onTap: () {
                                          setState(() {
                                            text1 = widget.lessons[number]['option1'];
                                            opt1 = !opt1;
                                            opt2 = false;
                                            opt3 = false;
                                            opt4 = false;
                                            print('text1:$text1');
                                          });
                                         },
                                         child: OptionBox(option:widget.lessons[number]['option1'],  gradient1: opt1 ? Color(0XFFF7B500) : Colors.white , gradient2: opt1 ? Color(0XFFF48C02) : Colors.white,))),
                                     SizedBox(width: 15.0,),
                                     Expanded(child: GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             text2 = widget.lessons[number]['option2'];
                                             opt2 = !opt2;
                                             opt1 = false;
                                             opt3 = false;
                                             opt4 = false;
                                             print('text2:$text2');
                                           });
                                         },
                                         child: OptionBox(option:widget.lessons[number]['option2'],  gradient1: opt2 ? Color(0XFFF7B500) : Colors.white , gradient2: opt2 ? Color(0XFFF48C02) : Colors.white,))),
                                     SizedBox(width: 15.0,),
                                     Expanded(child: GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             text3 = widget.lessons[number]['option3'];
                                             opt3 = !opt3;
                                             opt2 = false;
                                             opt1 = false;
                                             opt4 = false;
                                             print('text1:$text3');
                                           });
                                         },
                                         child: OptionBox(option:widget.lessons[number]['option3'],  gradient1: opt3 ? Color(0XFFF7B500) : Colors.white , gradient2: opt3 ? Color(0XFFF48C02) : Colors.white,))),
                                     SizedBox(width: 15.0,),
                                     Expanded(child: GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             text4 = widget.lessons[number]['option4'];
                                             opt4 = !opt4;
                                             opt2 = false;
                                             opt3 = false;
                                             opt1 = false;
                                             print('text4:$text4');
                                           });
                                         },
                                         child: OptionBox(option:widget.lessons[number]['option4'],  gradient1: opt4 ? Color(0XFFF7B500) : Colors.white , gradient2: opt4 ? Color(0XFFF48C02) : Colors.white,))),
                                   ],
                                 ),
                                 SizedBox(height: 30.0,),
                               ],
                             ),
                             SizedBox(height: 80.0,),
                             FlatButton(
                                 color: Color(0XFFF21600),
                                 onPressed: () {
                                   setState(() {
                                     _bottomSheetMenu();
                                     result.add(correct());
                                     print('result:$result');
                                   });
                                   print('answer:${correct()}');
                                 }, child: Text('Continue', style: TextStyle( color: Colors.white),)
                             )
                           ],
                         ),
                       ),
                     ],

                   )
                 ],
               )
             ],
           ),
         ),
       ],
      ),
    );
  }
}



