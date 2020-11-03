// import 'package:flutter/material.dart';
// import 'package:nkuzi_igbo/models/test.dart';
//
// import 'itest_manager.dart';
//
// class MatchTest extends StatefulWidget {
//   final ITestManager manager;
//   final List<Test> tests;
//   @override
//   _MatchTestState createState() => _MatchTestState();
// }
//
// class _MatchTestState extends State<MatchTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Column(
//           children: <Widget>[
//             Center(
//               child: HtmlWidget(
//                 '${widget.lessons[number]['test'][testNumber]['question']}',
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Container(
//                 padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
//                 child: Column(
//                   children: <Widget>[
//                     Image(
//                       image: NetworkImage(
//                           "${widget.lessons[number]['test'][testNumber]['matchQuestionImage']}"),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       '${widget.lessons[number]['test'][testNumber]['matchQuestion']}',
//                       style: TextStyle(
//                           fontSize: 20.0, fontWeight: FontWeight.w600),
//                     )
//                   ],
//                 )),
//             SizedBox(
//               height: 40.0,
//             ),
//             Column(
//               children: <Widget>[
//                 Wrap(
//                   spacing: 20.0,
//                   runSpacing: 20,
//                   alignment: WrapAlignment.spaceEvenly,
//                   children: <Widget>[
//                     GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             checkAnswer3(widget.lessons[number]['test']
//                                 [testNumber]['optionI']);
//                             match1 = !match1;
//                             match2 = false;
//                             match3 = false;
//                             match4 = false;
//                             print(match1);
//                           });
//                         },
//                         child: OptionBox(
//                           option: widget.lessons[number]['test'][testNumber]
//                               ['optionI'],
//                           gradient1: match1 ? Color(0XFFF7B500) : Colors.white,
//                           gradient2: match1 ? Color(0XFFF48C02) : Colors.white,
//                           fontColor: match1 ? Colors.white : Colors.black,
//                         )),
//                     GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             checkAnswer3(widget.lessons[number]['test']
//                                 [testNumber]['optionII']);
//                             match2 = !match2;
//                             match1 = false;
//                             match3 = false;
//                             match4 = false;
//                             print('text2:$match2');
//                           });
//                         },
//                         child: OptionBox(
//                           option: widget.lessons[number]['test'][testNumber]
//                               ['optionII'],
//                           gradient1: match2 ? Color(0XFFF7B500) : Colors.white,
//                           gradient2: match2 ? Color(0XFFF48C02) : Colors.white,
//                           fontColor: match2 ? Colors.white : Colors.black,
//                         )),
//                     GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             checkAnswer3(widget.lessons[number]['test']
//                                 [testNumber]['optionIII']);
//                             match3 = !match3;
//                             match2 = false;
//                             match1 = false;
//                             match4 = false;
//                             print('text1:$match3');
//                           });
//                         },
//                         child: OptionBox(
//                           option: widget.lessons[number]['test'][testNumber]
//                               ['optionIII'],
//                           gradient1: match3 ? Color(0XFFF7B500) : Colors.white,
//                           gradient2: match3 ? Color(0XFFF48C02) : Colors.white,
//                           fontColor: match3 ? Colors.white : Colors.black,
//                         )),
//                     GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             checkAnswer3(widget.lessons[number]['test']
//                                 [testNumber]['optionIV']);
//                             match4 = !match4;
//                             match2 = false;
//                             match3 = false;
//                             match1 = false;
//                             print('text4:$match4');
//                           });
//                         },
//                         child: OptionBox(
//                           option: widget.lessons[number]['test'][testNumber]
//                               ['optionIV'],
//                           gradient1: match4 ? Color(0XFFF7B500) : Colors.white,
//                           gradient2: match4 ? Color(0XFFF48C02) : Colors.white,
//                           fontColor: match4 ? Colors.white : Colors.black,
//                         )),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
