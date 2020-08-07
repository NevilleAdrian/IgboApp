import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContinueList extends StatefulWidget {
  ContinueList({ this.lessons });
   final Map<String, Object> lessons;

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
                            Text('Lesson ${widget.lessons['id']} - ${widget.lessons['form']}', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            Text('${widget.lessons['type']} in Igbo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25, ),)
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        SvgPicture.asset("assets/images/play-button.svg",),
                        SizedBox(height: 20.0,),
                        Column(
                          children: <Widget>[
                            Text('Lesson duration', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            Text('${widget.lessons['time']}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 25),)
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
