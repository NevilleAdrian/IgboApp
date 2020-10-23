import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/quiz.dart';

class ContinueList extends StatefulWidget {
  ContinueList({ this.lessons, this.form, this.name, this.time, this.courses, this.description, this.category, this.id, this.title, this.thumbnail });
  final  List<dynamic>  lessons;
  final List <dynamic> courses;
  final String description;
  final String form;
  final String name;
  String thumbnail;
  final String time;
  final String category;
  final String id;
  final String title;

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
            colorFilter: ColorFilter.mode(Color(0XFF330000), BlendMode.dstATop),
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 60.0,),
                        Column(
                          children: <Widget>[
                            Text('Lesson 1 - ${widget.form}', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text('${widget.name}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25, ),),
                            )
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
                                    courses: widget.courses,
                                    description: widget.description,
                                    category: widget.category,
                                    id: widget.id,
                                    name: widget.name,
                                    title: widget.title,
                                    thumbnail: widget.thumbnail,
                                  )
                              ),
                            );
                          },
                            child: SvgPicture.asset(
                              "assets/images/play-button.svg",
                            )
                        ),
                        SizedBox(height: 20.0,),
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
