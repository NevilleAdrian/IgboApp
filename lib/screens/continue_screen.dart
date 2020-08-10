import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/quiz.dart';

class ContinueList extends StatefulWidget {
  ContinueList({ this.lessons, this.id, this.form, this.type, this.time });
  final List<Map<String, Object>> lessons;
  final String id;
  final String form;
  final String type;
  final String time;

  @override
  _ContinueListState createState() => _ContinueListState();
}

class _ContinueListState extends State<ContinueList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('lessons: ${widget.lessons}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0XFF7C0D00),
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Lesson ${widget.id} - ${widget.form}', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            Text('${widget.type} in Igbo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25, ),)
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizScreen(
                                    lessons: widget.lessons,
                                  )
                              ),
                            );
                          },
                            child: SvgPicture.asset(
                              "assets/images/play-button.svg",
                            )
                        ),
                        SizedBox(height: 20.0,),
                        Column(
                          children: <Widget>[
                            Text('Lesson duration', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            Text('${widget.time}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 25),)
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ],
          )
        )
      ),
    );
  }
}
