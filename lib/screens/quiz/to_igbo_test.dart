import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/screens/quiz/itest_manager.dart';
import 'package:nkuzi_igbo/ui_widgets/network_image_cache.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

class ToIgboTest extends StatelessWidget {
  final ITestManager manager;
  final Test test;
  final Function onTap;
  final bool disable;
  final int selectedIndex;
  ToIgboTest(
      {this.manager, this.test, this.onTap, this.disable, this.selectedIndex});

  bool correctAnswer(String userOption) {
    return manager.checkAnswer(
      correctOption: test?.correctOption,
      userOption: userOption,
    );
  }

  void changeSelectedIndex(int index, String userOption) {
    onTap(correctAnswer(userOption), index);
  }

  bool shouldShowCorrectOption(String userOption, int currentIndex) {
    return disable &&
        correctAnswer(userOption) &&
        selectedIndex != currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    print('selectedIndex: $selectedIndex should disable: $disable');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Padded(
          child: HtmlWidget(
            test?.question ?? '',
          ),
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
                height: 0.3,
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  'in English',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ))),
            Expanded(
                flex: 1, child: Container(color: Colors.grey, height: 0.3)),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: IgboOption(
                            showCorrect:
                                shouldShowCorrectOption(test?.optionA, 0),
                            isSelected: selectedIndex == 0,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(0, test?.optionA),
                            option: test?.optionA,
                            image: test?.optionAImage,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: IgboOption(
                            showCorrect:
                                shouldShowCorrectOption(test?.optionB, 1),
                            isSelected: selectedIndex == 1,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(1, test?.optionB),
                            option: test?.optionB,
                            image: test?.optionBImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: IgboOption(
                            showCorrect:
                                shouldShowCorrectOption(test?.optionC, 2),
                            isSelected: selectedIndex == 2,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(2, test?.optionC),
                            option: test?.optionC,
                            image: test?.optionCImage,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: IgboOption(
                            showCorrect:
                                shouldShowCorrectOption(test?.optionD, 3),
                            isSelected: selectedIndex == 3,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(3, test?.optionD),
                            option: test?.optionD,
                            image: test?.optionDImage,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}

class IgboOption extends StatelessWidget {
  final bool isSelected;
  final String option;
  final String image;
  final Function onTap;
  final bool showCorrect;
  Color get _borderColor {
    if (showCorrect) return Color(0xFF66C109);
    if (isSelected) return Color(0XFFF59C01);
    return Colors.transparent;
  }

  IgboOption(
      {this.isSelected, this.option, this.onTap, this.image, this.showCorrect});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: _borderColor),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (!isNullOrEmpty(image))
                Expanded(
                  child: AppNetworkImage(
                    image: image,
                  ),
                ),
              SizedBox(
                height: 8.0,
              ),
              if (shouldShow(option))
                HtmlWidget(
                  option ?? '',
                )
            ],
          )),
    );
  }
}

class Padded extends StatelessWidget {
  final Widget child;

  Padded({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: child,
    );
  }
}
