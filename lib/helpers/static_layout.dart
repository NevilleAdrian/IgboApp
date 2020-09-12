import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class StaticLayout extends StatelessWidget {
  final String content;
  final String title;
  StaticLayout({this.content, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: <Widget>[
                SizedBox(child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                )
              ],
            )),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 25.0, right: 25.0, bottom: 20),
            child: HtmlWidget(content ?? ''),
          ),
        ),
      ),
    );
  }
}
