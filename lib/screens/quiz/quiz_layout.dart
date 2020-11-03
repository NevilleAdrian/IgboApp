import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/ui_widgets/progress_bar.dart';

import '../categories_screen.dart';

class QuizLayout extends StatelessWidget {
  final Widget body;
  final Widget footer;
  final double progressWidth;
  final String progress;
  final bool hasAudio;
  final dynamic lessons;
  final dynamic description;
  final dynamic id;
  final dynamic thumbnail;
  QuizLayout(
      {this.body,
      this.footer,
      this.lessons,
      this.description,
      this.id,
      this.thumbnail,
      this.progressWidth,
      this.progress,
      this.hasAudio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: <Widget>[
                        CircleClose(
                          onTap: () {
                            // var data = Auth.authProvider(context).category.firstWhere((element) {
                            //   return element['_id'] == widget.id;
                            // });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoriesScreen(
                                          lessons: lessons,
                                          description: description,
                                          id: id,
                                          thumbnail: thumbnail,
                                        )),
                                ModalRoute.withName('/'));
                          },
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                          child: ProgressBar(
                            width: progressWidth,
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          progress ?? '2/4',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15,
                              fontFamily: 'Baloo',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: body ?? Container(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            footer ?? Container(),
          ],
        ),
      ),
    );
  }
}

class CircleClose extends StatelessWidget {
  final Function onTap;

  CircleClose({this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          radius: 22.0,
          child: SvgPicture.asset(
            "assets/images/cancel.svg",
            height: 22,
          ),
        ),
      ),
    );
  }
}
